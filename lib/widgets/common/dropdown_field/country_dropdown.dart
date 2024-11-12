import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../backend/model/profile/profile_info_model.dart';
import '../../../../../views/utils/custom_color.dart';
import '../../../../../views/utils/dimensions.dart';
import '../../../views/utils/custom_style.dart';
import '../../../views/utils/size.dart';

class CountryDropDown extends StatelessWidget {
  final String selectMethod;
  final String? label;
  final List<Country> itemsList;
  final void Function(Country?)? onChanged;

  const CountryDropDown({
    required this.itemsList,
    super.key,
    required this.selectMethod,
    this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.marginSizeVertical * 0.2),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            label ?? "",
            style: CustomStyle.darkHeading4TextStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: CustomColor.primaryDarkTextColor,
            ),
          ),
          label != null ? verticalSpace(7) : verticalSpace(0),
          Container(
            height: Dimensions.inputBoxHeight * 0.75,
            decoration: BoxDecoration(
              color: CustomColor.greyColor.withOpacity(0.2),
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            ),
            child: DropdownButtonHideUnderline(
              child: Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.paddingSize * 0.2,
                    right: Dimensions.paddingSize * 0.7),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  dropdownColor: CustomColor.whiteColor,
                  hint: Padding(
                    padding: EdgeInsets.only(
                      left: Dimensions.paddingSize * 0.7,
                      right: Dimensions.paddingSize * 0.7,
                    ),
                    child: Text(selectMethod,
                        style: const TextStyle(
                            color: CustomColor.primaryDarkTextColor)),
                  ),
                  icon: Padding(
                    padding: EdgeInsets.only(
                        right: Dimensions.paddingSize * 0.12,
                        left: Dimensions.paddingSize * 0.5),
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: CustomColor.greyColor,
                    ),
                  ),
                  isExpanded: true,
                  menuMaxHeight: 350.h,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  items: itemsList.map<DropdownMenuItem<Country>>((value) {
                    return DropdownMenuItem<Country>(
                      value: value,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.paddingSize * 0.53),
                        child: Text(
                          value.name,
                          style: GoogleFonts.inter(
                            color: selectMethod == value.name
                                ? CustomColor.primaryDarkTextColor
                                : CustomColor.primaryDarkTextColor,
                            fontSize: Dimensions.headingTextSize4,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
