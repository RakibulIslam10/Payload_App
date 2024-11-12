import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import '../../../views/utils/dimensions.dart';
import '../text_labels/title_heading2_widget.dart';
import 'back_button.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar(
    this.title, {
    super.key,
    this.backgroundColor,
    this.elevation = 0,
    this.autoLeading = false,
    this.showBackButton = false,
    this.centerTitle = true,
    this.action,
    this.leading,
    this.bottom,
    this.toolbarHeight,
    this.appbarSize,
    this.titleFontWeight,
    this.titleColor,
  });

  final String title;
  final FontWeight? titleFontWeight;
  final Color? backgroundColor;
  final double elevation;
  final List<Widget>? action;
  final Widget? leading;
  final bool autoLeading;
  final bool showBackButton;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final double? appbarSize;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: CustomColor.primaryDarkColor),
      centerTitle: centerTitle,
      title: TitleHeading2Widget(
        text: title,
        fontWeight: titleFontWeight ?? FontWeight.bold,
        color: titleColor ?? CustomColor.primaryDarkColor,
      ),
      actions: action,
      leading: showBackButton
          ? leading ??
              BackButtonWidget(
                onTap: () {
                  Get.close(1);
                },
              )
          : null,
      bottom: bottom,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      scrolledUnderElevation: 0,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: autoLeading,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }

  @override
  // Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  Size get preferredSize =>
      Size.fromHeight(appbarSize ?? Dimensions.appBarHeight);
}
