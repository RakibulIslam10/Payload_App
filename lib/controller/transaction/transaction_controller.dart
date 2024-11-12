import 'package:get/get.dart';
import 'package:payloadui/backend/model/transaction/transaction_history_model.dart';
import 'package:payloadui/backend/services/transaction/transaction_api_service.dart';
import '../../backend/utils/api_method.dart';

class TransactionController extends GetxController {
  var latestTransactions = <Transaction>[].obs;
  final _isLoading = false.obs;

  late TransactionModel _transactionModel;

  bool get isLoading => _isLoading.value;

  TransactionModel get transactionModel => _transactionModel;

  @override
  void onInit() {
    getTransactionApiProcess();
    super.onInit();
  }

  Future<void> getTransactionApiProcess() async {
    _isLoading.value = true;
    update();

    try {
      final value = await TransactionApiService.getTransactionHistory();
      if (value != null) {
        _transactionModel = value;
        setData(_transactionModel);
      }
    } catch (error) {
      log.e(error);
    } finally {
      _isLoading.value = false;
      update();
    }
  }

  void setData(TransactionModel transactionModel) {
    latestTransactions.assignAll(transactionModel.data!.transactions);
  }
}
