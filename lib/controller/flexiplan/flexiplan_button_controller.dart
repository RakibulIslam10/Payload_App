import 'package:get/get.dart';

class FlexiplanScreenController extends GetxController {
  final List<String> validityTextList = ["1", "3", "7", "15", "30"];
  final List<String> internetPackList = [
    "0 MB",
    "10 GB",
    "0 MB",
    "0 MB",
    "0 MB",
    "50 GB",
    "0 MB",
    "10 GB",
    "10 GB",
    "50 GB",
    "0 MB",
    "10 GB",
    "10 GB",
  ];
  final List<String> minutesPackList = [
    "0",
    "10",
    "20",
    "30 ",
    "40 ",
    "50",
    "0",
    "10",
    "10",
  ];
  final List<String> smsPackList = [
    "0",
    "10",
    "20",
    "30 ",
    "40 ",
    "50",
  ];

  RxInt validitySelectedIndex = (1).obs;
  RxInt internetSelectedIndex = (1).obs;
  RxInt minutesSelectedIndex = (1).obs;
  RxInt smsSelectedIndex = (1).obs;





  void validitySelectAvatar(int index) {
    validitySelectedIndex.value = index;
  }

  void internetSelectAvatar(int index) {
    internetSelectedIndex.value = index;
  }

  void minutesSelectAvatar(int index) {
    minutesSelectedIndex.value = index;
  }

  void smsSelectAvatar(int index) {
    smsSelectedIndex.value = index;
  }
}
