import 'package:flutter/material.dart';
import 'package:smartnotestest/core/enums/view_state.dart';
import 'package:smartnotestest/core/helper/pagination_helper.dart';
import 'package:smartnotestest/core/manager/api_data_manager.dart';
import 'package:smartnotestest/core/model/_notification_response_model.dart';
import 'package:smartnotestest/core/model/notification_itemModel.dart';
import 'package:smartnotestest/core/repository/notification_repository.dart';
import 'package:smartnotestest/core/viewmodel/_base_model.dart';

class NotificationViewModel extends BaseModel implements PaginationHelper {
  SCRResponseModel notificationResponseModel;
  NotificationRepository _notificationRepository = NotificationRepository();
  List<NotificationItemModel> notificationList = [];
  int _currentPage = 1;
  NotificationItemModel loadingIndicator = NotificationItemModel();
  bool isFetchingFirstTime = false;

  Future<List<NotificationItemModel>> _fetchNotifications() async {
    print(
        "*********************************************************${_currentPage}*************************************************************");
    List<NotificationItemModel> newNotificationList = [];
    setState(ViewState.Busy);
    notificationResponseModel =
    await _notificationRepository.getNotification(pageNo: _currentPage);
    if (notificationResponseModel.result) {
      newNotificationList = APIDataManager.generateNotificationList(
          notificationList: notificationResponseModel.dataResponse);
    }
    setState(ViewState.Idle);
    return newNotificationList;
  }

  Future<SCRResponseModel> deleteNotification(
      {@required String notificationID}) async {
    setState(ViewState.Busy);
    SCRResponseModel deleteResponse = await _notificationRepository
        .deleteNotification(notificationID: notificationID);
    setState(ViewState.Idle);
    return deleteResponse;
  }

  @override
  void handleItemCreated(int index) async {
    var itemPosition = index + 1;
    var requestMoreData =
        (itemPosition + PaginationHelper.createdNewItemRequestThreshold) %
            PaginationHelper.itemRequestThreshold ==
            0 &&
            itemPosition != 0;
    var pageToRequest =
        (itemPosition + PaginationHelper.createdNewItemRequestThreshold) ~/
            PaginationHelper.itemRequestThreshold;

    debugPrint("itemPosition==>$itemPosition");
    debugPrint("pageToRequest==>$pageToRequest");
    debugPrint("requestMoreData==>$requestMoreData");
    debugPrint("pageToRequest==>$pageToRequest");

    if (requestMoreData && pageToRequest > _currentPage) {
      print('handleItemCreated | pageToRequest: $pageToRequest');
      _currentPage = pageToRequest;
      showLoadingIndicator();
      var newOrderBookingList = await _fetchNotifications();
      notificationList.addAll(newOrderBookingList);
      removeLoadingIndicator();
    }
  }

  Future<SCRResponseModel> deleteNotifications({@required String notificationID}) async
  {
    setState(ViewState.Busy);
    notificationResponseModel = await _notificationRepository.deleteNotification(notificationID: notificationID);
    setState(ViewState.Idle);
    return notificationResponseModel;
  }

  @override
  Future initiateDataFetching() async {
    _currentPage = 1;
    notificationList = List();
    isFetchingFirstTime = true;
    var newNotificationList = await _fetchNotifications();
    notificationList.addAll(newNotificationList);
    isFetchingFirstTime = false;
    notifyListeners();
  }

  @override
  void removeLoadingIndicator() {
    loadingIndicator.isLoading = false;
    notificationList.remove(loadingIndicator);
    notifyListeners();
  }

  @override
  void showLoadingIndicator() {
    loadingIndicator.isLoading = true;
    notificationList.add(loadingIndicator);
    notifyListeners();
  }
}
