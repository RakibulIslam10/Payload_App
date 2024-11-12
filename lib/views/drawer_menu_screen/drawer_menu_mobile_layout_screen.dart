import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/local_storage/local_storage.dart';
import 'package:payloadui/custom_assets/assets.gen.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/routes/routes.dart';
import 'package:payloadui/views/web_view/web_view_screen.dart';
import 'package:payloadui/widgets/common/custom_container.dart';
import 'package:payloadui/widgets/profile_display_widget.dart';
import '../../backend/utils/custom_loading_api.dart';
import '../../widgets/common/text_labels/title_heading2_widget.dart';
import '../../widgets/common/text_labels/title_heading4_widget.dart';
import '../utils/custom_color.dart';
import '../utils/dimensions.dart';
import '../utils/size.dart';

class MyDrawerMenu extends StatelessWidget {
  const MyDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: CustomColor.whiteColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.heightSize * 2),
                  child: ProfileDisplayWidget(
                      imagePath: Assets.logo.profilePic.path,
                      title: "Test User",
                      subTitle: "user@appdevs.net"),
                ),
                ListTile(
                  title: const TitleHeading4Widget(
                    text: Strings.changePassword,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.changePasswordScreen);
                  },
                  leading: const Icon(
                    Icons.vpn_key,
                  ),
                ),
                ListTile(
                  title: const TitleHeading4Widget(
                    text: Strings.KYCVerification,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.kycVerificationScreen);
                  },
                  leading: const Icon(
                    Icons.verified,
                  ),
                ),
                ListTile(
                  title: const TitleHeading4Widget(
                    text: Strings.twofAVerification,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.twofaVerificationScreen);
                  },
                  leading: const Icon(
                    Icons.verified_user,
                  ),
                ),
                ListTile(
                  title: const TitleHeading4Widget(
                    text: Strings.privacyPolicy,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    Get.to(WebViewScreen(
                        url: LocalStorage.getPrivacyPolicyLink(),
                        title: Strings.privacyPolicy));
                  },
                  leading: const Icon(
                    Icons.privacy_tip,
                  ),
                ),
                ListTile(
                  title: const TitleHeading4Widget(
                    text: Strings.aboutUs,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    Get.to(WebViewScreen(
                        url: LocalStorage.getAboutUsLink(),
                        title: Strings.aboutUs));
                  },
                  leading: const Icon(
                    Icons.info,
                  ),
                ),
                ListTile(
                  title: const TitleHeading4Widget(
                    text: Strings.contactUs,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    Get.to(WebViewScreen(
                        url: LocalStorage.getContactUsLink(),
                        title: Strings.contactUs));
                  },
                  leading: const Icon(
                    Icons.contact_mail,
                  ),
                ),
                ListTile(
                  title: const TitleHeading4Widget(
                    text: Strings.newsAndBlog,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.newsAndBlogScreen);
                  },
                  leading: const Icon(
                    Icons.newspaper,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  signOutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Dialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius),
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.paddingSize),
              child: Column(
                crossAxisAlignment: crossStart,
                mainAxisSize: mainMin,
                children: [
                  const TitleHeading2Widget(
                    text: "Log Out Alert",
                    textAlign: TextAlign.start,
                  ),
                  verticalSpace(Dimensions.heightSize),
                  const TitleHeading4Widget(
                    text: Strings.areYouSure,
                    textAlign: TextAlign.start,
                    opacity: 0.80,
                  ),
                  verticalSpace(Dimensions.heightSize),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: CustomContainer(
                            height: Dimensions.buttonHeight * 0.7,
                            borderRadius: Dimensions.radius * 0.8,
                            color: Get.isDarkMode
                                ? CustomColor.primaryBGLightColor
                                .withOpacity(0.15)
                                : CustomColor.primaryBGDarkColor
                                .withOpacity(0.15),
                            child: const TitleHeading4Widget(
                              text: Strings.cancel,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(Dimensions.widthSize),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // controller.signOutProcess();
                          },
                          child:  CustomContainer(
                              height: Dimensions.buttonHeight * 0.7,
                              borderRadius: Dimensions.radius * 0.8,
                              color: Theme.of(context).primaryColor,
                              child: const TitleHeading4Widget(
                                text: Strings.okay,
                                color: CustomColor.whiteColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                    ],
                  ).paddingAll(Dimensions.paddingSize * 0.5),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
