import 'package:flutter/material.dart';
import 'package:payloadui/custom_assets/assets.gen.dart';
import 'package:payloadui/views/utils/size.dart';
import '../../../../views/utils/custom_color.dart';
import '../../../../views/utils/dimensions.dart';
import '../text_labels/title_heading4_widget.dart';

class IconTextContainer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String? showImage;

  const IconTextContainer({
    super.key,
    required this.text,
    required this.onTap,
    this.showImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: Dimensions.heightSize * 2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(showImage ?? Assets.images.noimge.path),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
          color: CustomColor.secondaryWhiteBoxColor,
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            horizontalSpace(Dimensions.marginSizeHorizontal * 0.2),
            TitleHeading4Widget(text: text),
          ],
        ),
      ),
    );
  }
}