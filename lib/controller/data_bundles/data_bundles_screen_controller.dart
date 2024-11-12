
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DataBundlesScreenController extends GetxController{
 final TextEditingController searchBarController = TextEditingController();

 @override
 void dispose() {
   searchBarController.dispose();
   super.dispose();
 }
}