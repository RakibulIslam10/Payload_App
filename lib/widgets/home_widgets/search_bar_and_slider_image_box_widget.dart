import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../language/language.dart';
import '../../views/utils/custom_color.dart';
import '../../views/utils/dimensions.dart';
import '../../views/utils/size.dart';
import '../common/inputs/primary_input_filed.dart';

class SearchBarAndSliderImageBoxWidget extends StatelessWidget {
  final TextEditingController searchBarController;
  final PageController pageController;
  final List<String> imageList;
  final RxInt currentIndex;

  const SearchBarAndSliderImageBoxWidget({
    super.key,
    required this.searchBarController,
    required this.pageController,
    required this.imageList,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.whiteColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal),
            child: PrimaryInputWidget(
              prefixIcon: const Icon(
                Icons.search_sharp,
                color: CustomColor.greyColor,
              ),
              controller: searchBarController,
              hint: Strings.searchPayload,
            ),
          ),
          verticalSpace(Dimensions.heightSize),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.23,
            child: PageView.builder(
              onPageChanged: (index) {
                currentIndex.value = index; // Update RxInt
              },
              controller: pageController,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal),
                  child: Container(
                    margin:
                    EdgeInsets.only(bottom: Dimensions.heightSize * 1.2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius),
                      image: DecorationImage(
                        image: NetworkImage(imageList[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
