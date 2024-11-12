import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/routes/routes.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/model/profile/profile_info_model.dart';
import '../../backend/services/profile/profile_api_services.dart';
import '../../backend/utils/api_method.dart';
import '../../widgets/common/image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final imageController = Get.put(InputImageController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxString userImagePath = ''.obs;
  RxString userEmail = "".obs;
  RxString userFullName = "".obs;
  RxString imageURL = "".obs;
  RxString countryName = "".obs;
  RxString mobileCode = "".obs;
  RxString selectedCountry = "".obs;

  @override
  void onInit() {
    getProfileInfoProcess();
    super.onInit();
  }


  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  late ProfileInfoModel _profileInfoModel;

  ProfileInfoModel get profileInfoModel => _profileInfoModel;

  ///* Get profile info api process

  Future<ProfileInfoModel> getProfileInfoProcess() async {
    _isLoading.value = true;
    update();
    await ProfileApiServices.getProfileInfoProcessApi().then((value) {
      _profileInfoModel = value!;
      _setData(_profileInfoModel);
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _profileInfoModel;
  }



  ///--------------PROFILE UPDATE PROCESS-------------------------------

  final _isUpdateLoading = false.obs;
  bool get isUpdateLoading => _isUpdateLoading.value;

  late CommonSuccessModel _profileUpdateModel;

  CommonSuccessModel get profileUpdateModel => _profileUpdateModel;

  Future<CommonSuccessModel> profileUpdateWithOutImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'country': selectedCountry.value,
      'mobile_code': mobileCode.value,
      'mobile': numberController.text,
      'email': emailController.text,

    };

    await ProfileApiServices.updateProfileWithoutImageApi(body: inputBody)
        .then((value) {
      _profileUpdateModel = value!;
      Get.offAllNamed(Routes.navigationScreen);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _profileUpdateModel;
  }

  // Profile update process with image
  Future<CommonSuccessModel> profileUpdateWithImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, String> inputBody = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'country': selectedCountry.value,
      'mobile_code': mobileCode.value,
      'mobile': numberController.text,
      'email': emailController.text,
    };

    await ProfileApiServices.updateProfileWithImageApi(
      body: inputBody,
      filepath: imageController.imagePath.value,
    ).then((value) {
      _profileUpdateModel = value!;
      Get.offAllNamed(Routes.navigationScreen);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _profileUpdateModel;
  }


  _setData(ProfileInfoModel profileInfoModel) {
    var profileImagePath = profileInfoModel.data.imagePaths;
    var data = profileInfoModel.data;
    firstNameController.text = data.userInfo.firstname;
    lastNameController.text = data.userInfo.lastname;
    numberController.text = data.userInfo.mobile;
    emailController.text = data.userInfo.email;
    selectedCountry.value = data.userInfo.country;
    mobileCode.value = data.userInfo.mobileCode;

    imageURL.value = '${profileImagePath.baseUrl}/${profileImagePath.pathLocation}/${data.userInfo.image}';
  }
}
