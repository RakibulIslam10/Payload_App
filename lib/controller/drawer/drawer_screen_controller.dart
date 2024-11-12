import 'package:get/get.dart';

import '../navigation/navigation_controller.dart';

class DrawerScreenController extends GetxController {
  final _navBarController = Get.put(BottomNavBarController());


  void backToHome() {
    _navBarController.changeIndex(0);
  }

  void backToRecharge() {
    _navBarController.changeIndex(1);
  }

  void backToServices() {
    _navBarController.changeIndex(2);
  }

  void backToProfile() {
    _navBarController.changeIndex(3);
  }
}