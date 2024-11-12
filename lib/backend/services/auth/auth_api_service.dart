import 'package:payloadui/backend/model/auth/forgot_password/resend_code_model.dart';
import 'package:payloadui/backend/model/auth/otp_verify/forgot_pass_otp_verify_model.dart';
import 'package:payloadui/backend/model/auth/otp_verify/login_otp_verify_model.dart';
import 'package:payloadui/backend/model/auth/register/register_model.dart';
import 'package:payloadui/backend/model/auth/sign_in/login_with_otp.dart';
import 'package:payloadui/backend/model/auth/sign_in/login_with_password_model.dart';
import '../../model/auth/forgot_password/forgot_password_model.dart';
import '../../model/common/common_success_model.dart';
import '../../model/two_fa/two_fa_info_model.dart';
import '../api_endpoint.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';

class AuthApiServices {
  ///___________  Log in With Password API PROCESS _____________________________

  static Future<LoginWithPasswordModel?> signInProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.loginWithPasswordAndOtpURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        LoginWithPasswordModel result =
            LoginWithPasswordModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Login in api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in SignInModel');
      return null;
    }
    return null;
  }

  ///______________________________  Log in With OTP API PROCESS _____________________________

  static Future<LoginWithOtpModel?> signInOtpProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.loginWithPasswordAndOtpURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        LoginWithOtpModel otpResult = LoginWithOtpModel.fromJson(mapResponse);
        // CustomSnackBar.success(otpResult.message.success.first.toString());
        return otpResult;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Sign in api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in SignInModel');
      return null;
    }
    return null;
  }

  ///_____________________________  LOGIN OTP VERIFY API PROCESS _____________________________

  static Future<LoginOtpVerifyModel?> loginOtpVerifyApiProcess({
    required Map<String, dynamic> body,
    required userId,
    required type,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        '${ApiEndpoint.loginOtpVerifyURL}$userId&type=$type',
        body,
        code: 200,
      );
      if (mapResponse != null) {
        LoginOtpVerifyModel result = LoginOtpVerifyModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Login otp verify process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in OtpVerificationModel');
      return null;
    }
    return null;
  }

  ///_____________________________  REGISTER API PROCESS _____________________________

  static Future<RegisterModel?> registerProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.registerURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        // RegisterModel otpResult = RegisterModel.fromJson(mapResponse);
        RegisterModel result = RegisterModel.fromJson(mapResponse);
        // CustomSnackBar.success(otpResult.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Register api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in RegisterModel');
      return null;
    }
    return null;
  }

  ///___________________________  FORGOT PASSWORD API PROCESS _____________________________

  static Future<ForgotPasswordModel?> forgotPasswordProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.forgotPasswordSendOtpURL,
        code: 200,
        body,
      );
      if (mapResponse != null) {
        ForgotPasswordModel result = ForgotPasswordModel.fromJson(mapResponse);
        CustomSnackBar.success(
          result.message.success.first.toString(),
        );
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from forgot password api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in forgotPasswordModel');
      return null;
    }
    return null;
  }

  ///___________________________  FORGOT PASSWORD OTP VERIFY PROCESS _____________________________

  static Future<ForgotPasswordOtpVerifyModel?> forgotPassOtpVerifyProcess(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.forgotPasswordOtpVerifyURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        ForgotPasswordOtpVerifyModel result =
            ForgotPasswordOtpVerifyModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Forgot password otp verify process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in OtpVerificationModel');
      return null;
    }
    return null;
  }

  ///___________________________  RESET PASSWORD PROCESS _____________________________

  static Future<CommonSuccessModel?> resetPasswordApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.resetPasswordURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Reset password process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in Reset password process api');
      return null;
    }
    return null;
  }

  ///___________________________RESEND Code PROCESS _____________________________

  static Future<ResendCodeModel?> getResendCode(String token) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
          "${ApiEndpoint.resendCodeURL}$token",
          code: 200,
          showResult: true);
      if (mapResponse != null) {
        ResendCodeModel result = ResendCodeModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from  get Resend Code process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///___________________________CHANGE PASSWORD API SERVICE _____________________________

  static Future<CommonSuccessModel?> changePasswordApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.passwordUpdateURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Change password process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in Change password process api');
      return null;
    }
    return null;
  }

  ///___________________________ LOGOUT API SERVICE _____________________________

  static Future<CommonSuccessModel?> signOutProcessApi(
      {Map<String, dynamic>? body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.signOutURL,
        body ?? {},
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e('Error from sign out process API service ==> $e');
      CustomSnackBar.error('Something went wrong!');
      return null;
    }
    return null;
  }

  ///___________________________ 2 TWO FA GET INFO ADDED _____________________________

  static Future<TwoFaInfoModel?> getTwoFAInfoAPi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.twoFAInfoURL,
        code: 200,
        showResult: false,
      );
      if (mapResponse != null) {
        TwoFaInfoModel modelData = TwoFaInfoModel.fromJson(mapResponse);

        return modelData;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from twofa api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in twofa info Api');
      return null;
    }
    return null;
  }

  ///___________________________ 2 TWO FA STATUS UPDATE _____________________________

  static Future<CommonSuccessModel?> twoFaUpdate(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.twoFAUpdateURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Two Fa Update process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///___________________________ 2 TWO FA STATUS UPDATE _____________________________

  static Future<CommonSuccessModel?> twoFaVerify(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.twoFAVerifyURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Two Fa Verify process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
