import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/model/add_money/manual_gateway/add_money_manual_insert_model.dart';
import 'package:payloadui/backend/model/common/common_success_model.dart';
import 'package:payloadui/backend/services/add_money/add_money_api_service.dart';
import 'package:payloadui/controller/wallet_recharge/wallet_recharge_screen_controller.dart';
import 'package:payloadui/language/language.dart';
import 'package:payloadui/routes/routes.dart';
import 'package:payloadui/views/wallet_recharge_screen/congratulation_screen.dart';
import '../../views/utils/dimensions.dart';
import '../../widgets/common/inputs/manual_payment_widget.dart';
import '../../widgets/common/inputs/primary_input_filed.dart';

class AddMoneyController extends GetxController {
  final controller = Get.put(WalletRechargeController());

  @override
  void onInit() {
    getManualGatewayProcess();
    super.onInit();
  }

  List<TextEditingController> inputFieldControllers = [];
  RxList inputFields = [].obs;
  RxBool hasFile = false.obs;
  List<String> listImagePath = [];
  List<String> listFieldName = [];

  RxString description = ''.obs;

  ///------------------------MANUAL GATEWAY PROCESS----------------------------------------

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  late AddMoneyManualInsertModel _addMoneyManualInsertModel;

  AddMoneyManualInsertModel get addMoneyManualInsertModel =>
      _addMoneyManualInsertModel;


  Future<AddMoneyManualInsertModel> getManualGatewayProcess() async {
    _isLoading.value = true;
    update();
    await AddMoneyApiServices.getManualGatewayInputFields(
        controller.alias.value)
        .then((value) {
      _addMoneyManualInsertModel = value!;
      description.value = addMoneyManualInsertModel.data.gateway.desc;
      final data = _addMoneyManualInsertModel.data.inputFields;

      for (int item = 0; item < data.length; item++) {
        var textEditingController = TextEditingController();
        inputFieldControllers.add(textEditingController);

        if (data[item].type.contains('file')) {
          hasFile.value = true;
          inputFields.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ManualPaymentImageWidget(
                labelName: data[item].label,
                fieldName: data[item].name,
              ),
            ),
          );
        } else if (data[item].type.contains('text') ||
            data[item].type.contains('textarea')) {
          inputFields.add(
            Column(
              children: [
                PrimaryInputWidget(
                  controller: inputFieldControllers[item],
                  label: data[item].label,
                  hint: data[item].label,
                  isValidator: data[item].required,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                      int.parse(data[item].validation.max.toString()),
                    ),
                  ],
                ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75),
              ],
            ),
          );
        }
      }
      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _addMoneyManualInsertModel;
  }

  ///------------------------MANUAL PAYMENT CONFIRM PROCESS----------------------------------------

  final _isConfirmLoading = false.obs;

  bool get isConfirmLoading => _isConfirmLoading.value;

  late CommonSuccessModel _manualPaymentConfirmModel;

  CommonSuccessModel get manualPaymentConfirmModel =>
      _manualPaymentConfirmModel;

  Future<CommonSuccessModel> manualPaymentProcess() async {
    _isConfirmLoading.value = true;
    Map<String, String> inputBody = {
      'currency': controller.alias.value,
      'invoice': controller.getInvoiceChecked.value,
      'amount': controller.amountController.text,
    };

    final data = addMoneyManualInsertModel.data.inputFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }

    await AddMoneyApiServices.manualPaymentConfirmApi(
        body: inputBody, fieldList: listFieldName, pathList: listImagePath)
        .then((value) {
      _manualPaymentConfirmModel = value!;

      Get.off(
            () => CongratulationScreen(
          subTitle: _manualPaymentConfirmModel.message.success.first,
          title: Strings.congratulations,
          route: Routes.navigationScreen,

            ),
      );
      _isConfirmLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isConfirmLoading.value = false;
    update();
    return _manualPaymentConfirmModel;
  }
}
