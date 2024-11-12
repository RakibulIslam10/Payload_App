import 'package:flutter/material.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/views/utils/dimensions.dart';
import 'package:payloadui/widgets/home_widgets/custom_recharge_amount_widget.dart';

class RechargeAmountInputWidget extends StatelessWidget {
  final List<String> rechargeAmounts;
  final ValueChanged<String> onAmountSelected;
  final TextEditingController fieldController;

  const RechargeAmountInputWidget({
    super.key,
    required this.rechargeAmounts,
    required this.onAmountSelected,
    required this.fieldController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.heightSize * 0.5),
      height: Dimensions.heightSize * 3.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
        color: CustomColor.secondaryWhiteBoxColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              controller: fieldController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: Dimensions.heightSize * 0.4,
                  left: Dimensions.widthSize,
                ),
                hintText: Strings.enterAmount,
                hintStyle: const TextStyle(
                  color: CustomColor.secondaryTextColor,
                  fontWeight: FontWeight.normal,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Row(
            children: rechargeAmounts.map((amount) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.marginSizeHorizontal * 0.2),
                child: CustomRechargeAmountWidget(
                  text: amount,
                  onPressed: () {
                    onAmountSelected(amount);
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
