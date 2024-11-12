import 'package:get/get.dart';

class RechargeDetailsScreenController extends GetxController{
  var isSwitched = false.obs;
  RxBool isChecked = false.obs;

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }

  void onPressedCheckbox(bool? value) {
    isChecked.value = value ?? false;}

}