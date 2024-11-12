import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:payloadui/backend/utils/custom_loading_api.dart';
import 'package:payloadui/controller/transaction/transaction_controller.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/views/utils/custom_color.dart';
import 'package:payloadui/widgets/common/text_labels/title_heading3_widget.dart';
import '../../widgets/common/appbar/primary_appbar.dart';
import '../../widgets/common/custom_transaction_item_widget.dart';

class PurchaseHistoryMobileLayoutScreen extends StatelessWidget {
  PurchaseHistoryMobileLayoutScreen({super.key});

  final controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbarWidget(),
        body: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : ListView.builder(
                  itemCount: controller.latestTransactions.length,
                  itemBuilder: (context, index) {
                    final dateOnly = DateFormat('dd');
                    final monthOnly = DateFormat('MMM');
                    final data = controller.latestTransactions[index];
                    return controller.latestTransactions.isNotEmpty
                        ? CustomTransactionItemWidget(
                            currency: data.requestCurrency,
                            title: data.type,
                            subTitle: data.trxId,
                            amount: double.parse(data.receiveAmount)
                                .toStringAsFixed(2),
                            month: monthOnly.format(data.createdAt),
                            day: dateOnly.format(data.createdAt),
                          )
                        : const Center(
                            child: TitleHeading3Widget(
                              text: Strings.noTransactionFound,
                            ),
                          );
                  },
                ),
        ));
  }

  _appbarWidget() {
    return const PrimaryAppBar(
      Strings.latestTransaction,
      autoLeading: true,
      showBackButton: false,
    );
  }
}
