import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/model/news_and_blog/grid_card_model.dart';
import 'package:payloadui/language/language.dart';
import '../../custom_assets/assets.gen.dart';

class NewsAndBlogScreenController extends GetxController {
  final PageController pageController = PageController();

  final List<String> imageList = [
    Assets.images.images12.path,
    Assets.images.images12.path,
    Assets.images.images12.path,
  ];
  var gridCardModel = <GridCardModel>[
    GridCardModel(
        imagePath: Assets.images.amazoncard.path,
        timeText: "04:47:23",
        dateText: "16-09-2025",
        title: "Computer",
        description: Strings.descriptionText),
    GridCardModel(
        imagePath: Assets.images.spotycard.path,
        timeText: "04:47:23",
        dateText: "16-09-2025",
        title: "Spoty Card",
        description: Strings.descriptionText),
    GridCardModel(
        imagePath: Assets.images.tikcard.path,
        timeText: "04:47:23",
        dateText: "16-09-2025",
        title: "Tika Card",
        description: Strings.descriptionText),
    GridCardModel(
        imagePath: Assets.images.amazoncard.path,
        timeText: "04:47:23",
        dateText: "16-09-2025",
        title: "Amazon Card",
        description: Strings.descriptionText),
    GridCardModel(
        imagePath: Assets.images.amazoncard.path,
        timeText: "04:47:23",
        dateText: "16-09-2025",
        title: "Amazon Card",
        description: Strings.descriptionText),
    GridCardModel(
        imagePath: Assets.images.images12.path,
        timeText: "04:47:23",
        dateText: "16-09-2025",
        title: "Gift Card",
        description: Strings.descriptionText),
  ].obs;

  RxInt currentIndex = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startAutoSlide();
  }

  @override
  void onClose() {
    pageController.dispose();
    _timer?.cancel();
    super.onClose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex.value < imageList.length - 1) {
        currentIndex.value++;
      } else {
        currentIndex.value = 0;
      }

      if (pageController.hasClients) {
        pageController.animateToPage(
          currentIndex.value,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
