import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../backend/model/dashboard/dashboard_model.dart';
import '../../backend/services/dashboard/dashboard_api_service.dart';
import '../../backend/utils/api_method.dart';

class DashboardController extends GetxController {
  final pageController = PageController();
  final searchBarController = TextEditingController();
  final inputAmountController = TextEditingController();

  RxInt currentIndex = 0.obs;
  Timer? _timer;

  // Loading state
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late DashboardModel _userDashboardDataModel;

  DashboardModel get getDashboardInfoModel => _userDashboardDataModel;

  // User data
  RxString userFullName = "".obs;
  RxString fullMobile = "".obs;
  RxString image = "".obs;
  RxString defaultImage = "".obs;
  RxString currency = "".obs;
  RxString balance = "".obs;
  RxString selectedAmount = ''.obs;

  RxInt mobileTopUpCount = 0.obs;
  RxInt giftCardCount = 0.obs;
  RxInt addMoneyCount = 0.obs;

  @override
  void onInit() {
    getDashboardProcessApi();
    _startAutoSlide();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    _timer?.cancel();
    super.onClose();
  }

  void _startAutoSlide() {
    _timer?.cancel();

    if (imageList.isNotEmpty) {
      _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
        currentIndex.value = (currentIndex.value + 1) % imageList.length;

        if (pageController.hasClients) {
          pageController.animateToPage(
            currentIndex.value,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  Future<DashboardModel> getDashboardProcessApi() async {
    _isLoading.value = true;

    try {
      final value = await DashboardApiService.getDashboardInfoApiProcess();
      if (value != null) {
        _userDashboardDataModel = value;
        _setData(_userDashboardDataModel);
      } else {
        log.e('Failed to fetch dashboard data: Data is null.');
      }
    } catch (onError) {
      log.e(onError);
    } finally {
      _isLoading.value = false;
    }

    return _userDashboardDataModel;
  }

  final List<String> imageList = [];

  void _setData(DashboardModel dashboardModel) {
    var data = dashboardModel.data.userInfo;
    var profileImagePath = dashboardModel.data.profileImagePaths;
    var bannerImage = dashboardModel.data.bannerImagePaths;
    userFullName.value = data.fullname;
    fullMobile.value = data.fullMobile;
    imageList.clear();
    mobileTopUpCount.value = dashboardModel.data.mobileTopupCount;
    giftCardCount.value = dashboardModel.data.giftcardCount;
    addMoneyCount.value = dashboardModel.data.addMoneyCount;

    for (var banner in dashboardModel.data.banner) {
      String imageUrl =
          '${bannerImage.baseUrl}/${bannerImage.pathLocation}/${banner.image}';
      imageList.add(imageUrl);
    }
    image.value =
        '${profileImagePath.baseUrl}/${profileImagePath.pathLocation}/${data.image}';
    defaultImage.value =
        "${dashboardModel.data.profileImagePaths.baseUrl}/${dashboardModel.data.profileImagePaths.defaultImage}";
    currency.value = getDashboardInfoModel.data.wallets.first.currency.code;
  }

  @override
  void dispose() {
    super.dispose();
    inputAmountController.dispose();
    searchBarController.dispose();
  }
}
