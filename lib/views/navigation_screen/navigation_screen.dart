import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import '../../controller/navigation/navigation_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../language/language.dart';
import '../../widgets/common/others/custom_image_widget.dart';
import '../utils/custom_color.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({super.key});

  final _navBarController = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavWidget(),
    );
  }

  _bodyWidget() => Obx(
      () => _navBarController.screens[_navBarController.currentIndex.value]);

  _bottomNavWidget() {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: CustomColor.whiteColor,
        selectedItemColor: CustomColor.primaryLightColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: CustomColor.greyColor,
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: _navBarController.changeIndex,
        currentIndex: _navBarController.currentIndex.value,
        items: [
          BottomNavigationBarItem(
            icon: CustomImageWidget(
              path: Assets.icons.home,
              height: Dimensions.heightSize * 2,
              color: _navBarController.currentIndex.value == 0
                  ? CustomColor.primaryLightColor
                  : CustomColor.greyColor,
            ),
            label: Strings.home,
          ),
          BottomNavigationBarItem(
            icon: CustomImageWidget(
              path: Assets.icons.wallet,
              height: Dimensions.heightSize * 2,
              color: _navBarController.currentIndex.value == 1
                  ? CustomColor.primaryLightColor
                  : CustomColor.greyColor,
            ),
            label: Strings.recharge,
          ),
          BottomNavigationBarItem(
            icon: CustomImageWidget(
              path: Assets.icons.package2,
              height: Dimensions.heightSize * 2,
              color: _navBarController.currentIndex.value == 2
                  ? CustomColor.primaryLightColor
                  : CustomColor.greyColor,
            ),
            label: Strings.services,
          ),
          BottomNavigationBarItem(
            icon: CustomImageWidget(
              path: Assets.icons.accountCircle,
              height: Dimensions.heightSize * 2,
              color: _navBarController.currentIndex.value == 3
                  ? CustomColor.primaryLightColor
                  : CustomColor.greyColor,
            ),
            label: Strings.profile,
          ),
        ],
      ),
    );
  }
}
