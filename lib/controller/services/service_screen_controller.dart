import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../navigation/navigation_controller.dart';

class ServicesScreenController extends GetxController {
  final TextEditingController searchBarController = TextEditingController();
  final BottomNavBarController _navBarController =
      Get.put(BottomNavBarController());

  void backToRecharge() {
    _navBarController.changeIndex(1);
  }
}
