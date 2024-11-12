import 'package:get/get.dart';
import 'package:payloadui/controller/profile/update_profile_controller.dart';
import '../../backend/local_storage/local_storage.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/auth/auth_api_service.dart';
import '../../backend/utils/api_method.dart';
import '../../language/language.dart';
import '../../routes/routes.dart';

class ProfileController extends GetxController {
  final controller = Get.put(UpdateProfileController());

  RxInt myIndex = 0.obs;

  final List buttonTextList = [
    Strings.english,
    Strings.bengali,
  ];

  appbarTranslatorButtonOnChange(int index) {
    myIndex.value = index;
  }


  /// => SIGN OUT PROCESS


  final _isLoading = false.obs;
  late CommonSuccessModel _signOutModel;


  bool get isLoading => _isLoading.value;
  CommonSuccessModel get signOutModel => _signOutModel;


  Future<CommonSuccessModel> signOutProcess() async {
    _isLoading.value = true;
    update();

    await AuthApiServices.signOutProcessApi(body: {}).then((value) {
      _signOutModel = value!;
      _whenSignOutCompleted();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _signOutModel;
  }

  void _whenSignOutCompleted() {
    LocalStorage.signOut();
    Get.offAllNamed(Routes.signInScreen);
  }

}
