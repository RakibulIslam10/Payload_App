import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/common/others/custom_image_widget.dart';

class TopAppBarWidget extends StatelessWidget {
  final IconData icon;
  final String imagePath;
  final double? imageHeight;
  final double? imageWidth;

  const TopAppBarWidget({
    super.key,
    required this.icon,
    required this.imagePath,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.heightSize * 2.6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
            child: Icon(icon),
          ),
          CustomImageWidget(
            path: imagePath,
            height: imageHeight ?? MediaQuery.of(context).size.height * 0.10,
            width: imageWidth ?? MediaQuery.of(context).size.height * 0.15,
          ),
          Container(),
        ],
      ),
    );
  }
}
