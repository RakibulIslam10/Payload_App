import 'package:flutter/material.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import '../../../views/utils/dimensions.dart';
import '../text_labels/title_heading4_widget.dart';

class CustomGiftCardWidget extends StatelessWidget {
  final List<String> imagePaths;
  final String titleText;

  const CustomGiftCardWidget({
    super.key,
    required this.imagePaths,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            child: PageView.builder(
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.8),
                    image: DecorationImage(
                      image: NetworkImage(imagePaths[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          TitleHeading4Widget(
            padding: EdgeInsets.only(top: Dimensions.heightSize * 0.5),
            text: titleText,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
