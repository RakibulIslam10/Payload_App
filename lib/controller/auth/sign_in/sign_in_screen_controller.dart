
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:payloadui/backend/local_storage/local_storage.dart';
import 'package:payloadui/backend/model/auth/register/country_model.dart';
import '../../../backend/model/auth/sign_in/login_with_otp.dart';
import '../../../backend/model/auth/sign_in/login_with_password_model.dart';
import '../../../backend/services/auth/auth_api_service.dart';
import '../../../backend/services/auth/country_list_api_service.dart';
import '../../../backend/utils/api_method.dart';
import '../../../language/language.dart';
import '../../../routes/routes.dart';

class SignInController extends GetxController {
  final passwordController = TextEditingController();
  final otpNumberController = TextEditingController();
  final numberController = TextEditingController();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getCountryListProcess();
  }

  RxInt myIndex = 0.obs;
  RxBool isPasswordHidden = true.obs;

  final List buttonTextList = [Strings.otp, Strings.password];

  customButtonOnchange(int index) {
    myIndex.value = index;
  }

  // Form validation and navigation
  RxInt twoFAStatus = 0.obs;

  void signInProcessApiAndCheckValidation() async {
    setSwitchingValue();

    if (myIndex.value == 0) {
      if (formKey1.currentState!.validate()) {
        await signInOtpProcess();
        Get.toNamed(Routes.otpVerificationScreen);
      }
    } else {
      if (formKey1.currentState!.validate()) {
        await signInProcess();
        if (twoFAStatus.value == 1) {
          Get.toNamed(Routes.twoFaOtpVerifyScreen);
        } else {
          Get.offAllNamed(Routes.navigationScreen);
        }
      }
    }
  }

  void setSwitchingValue() {
    if (myIndex.value == 0) {
      switching.value = 'otp';
    } else {
      switching.value = 'password';
    }
  }

  ///____________________ API CALL FOR PASSWORD LOGIN AND OTP_____________________________

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late LoginWithPasswordModel _loginWithPasswordModel;
  late LoginWithOtpModel _loginWithOTPModel;

  LoginWithPasswordModel get loginWithPasswordModel => _loginWithPasswordModel;

  LoginWithOtpModel get loginWithOTPModel => _loginWithOTPModel;

  RxString switching = ''.obs;

//Login With Password

  Future<LoginWithPasswordModel> signInProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'otp_number': otpNumberController.text,
      'password': passwordController.text,
      'password_number': '${mobileCode.value}${numberController.text}',
      'switch': switching.value,
    };

    await AuthApiServices.signInProcessApi(body: inputBody).then((value) {
      _loginWithPasswordModel = value!;
      _isLoading.value = false;
      LocalStorage.saveToken(token: _loginWithPasswordModel.data.token);
      twoFAStatus.value = _loginWithPasswordModel.data.userInfo.twoFactorStatus;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _loginWithPasswordModel;
  }

  //Login With OTP

  RxInt userId = 0.obs;
  RxString type = "".obs;

  Future<LoginWithOtpModel> signInOtpProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'otp_number': '${mobileCode.value}${otpNumberController.text}',
      'switch': switching.value,
    };

    await AuthApiServices.signInOtpProcessApi(body: inputBody).then((value) {
      _loginWithOTPModel = value!;
      _isLoading.value = false;
      userId.value = _loginWithOTPModel.data.userInfo.id;
      type.value = _loginWithOTPModel.data.type;

      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _loginWithOTPModel;
  }

  /// => ----------- GET COUNTRY API ---------------------------------

  final List<Country> countryNameList = [];
  RxString mobileCode = "".obs;
  RxString selectedCountry = "".obs;

  late CountryModel _countryListModel;

  CountryModel get countryListModel => _countryListModel;

  Future<CountryModel> getCountryListProcess() async {
    await CountryListApiService.getCountryListInfoProcessApi().then((value) {
      _countryListModel = value!;
      for (var element in _countryListModel.data.countries) {
        countryNameList.add(
          Country(
              mobileCode: element.mobileCode,
              currencyCode: element.currencyCode,
              currencyName: element.currencyName,
              currencySymbol: element.currencySymbol,
              id: element.id,
              iso2: element.iso2,
              name: element.name),
        );
      }

      mobileCode.value = _countryListModel.data.countries.first.mobileCode;
      selectedCountry.value = _countryListModel.data.countries.first.name;

      _setData(_countryListModel);
    }).catchError((onError) {
      log.e(onError);
    }).whenComplete(() {
      _isLoading.value = false;
      update();
    });

    return _countryListModel;
  }

  void _setData(CountryModel countryModel) {}

  @override
  void dispose() {
    otpNumberController.dispose();
    numberController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
