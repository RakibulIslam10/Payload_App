import 'package:payloadui/extensions/custom_extensions.dart';

class ApiEndpoint {
  static const String mainDomain = "https://sajid.appdevs.team/payload";
  static const String baseUrl = "$mainDomain/api/v1";

  //-> Login With OTP And Password
  static String loginWithPasswordAndOtpURL = '/login'.addBaseURl();

  //Login Otp Verify
  static String loginOtpVerifyURL = '/login/verification?user='.addDBaseURl();

  //-> Register
  static String registerURL = '/register'.addBaseURl();

  //Country List
  static String countryListURL = '/settings/country'.addBaseURl();

  // Dashboard
  static String userDashboardURL = '/user/dashboard'.addBaseURl();

  //-> Profile
  static String profileInfoGetURL = '/user/profile/info'.addBaseURl();

  //-> Profile Update
  static String profileUpdateURL = '/user/profile/info/update'.addDBaseURl();

  //Basic Setting
  static String basicSettingURL = '/settings/basic-settings?lang=es'.addBaseURl();

  //-> Forgot Password Send Otp
  static String forgotPasswordSendOtpURL = '/password/forgot/find/user'.addBaseURl();

  //-> Forgot Password Otp Verify
  static String forgotPasswordOtpVerifyURL = '/password/forgot/verify/code'.addBaseURl();

  //=> Reset Password
  static String resetPasswordURL = '/password/forgot/reset'.addBaseURl();

  //=> Resend Code
  static String resendCodeURL = '/password/forgot/resend/code?token='.addDBaseURl();

  //=> Change Password
  static String passwordUpdateURL = '/user/profile/password/update'.addBaseURl();

  //=> LogOut
  static String signOutURL = '/user/logout'.addBaseURl();

  //=> Transaction History
  static String transactionHistoryURL = '/user/transaction/log'.addBaseURl();

  //=> Payment Gateway
  static String paymentGateWayURL = '/user/add-money/payment-gateways'.addBaseURl();

  //=> Automatic Gateway
  static String automaticPaymentURL = '/user/add-money/automatic/submit'.addBaseURl();

  //=> Manual Gateway Get
  static String manualPaymentURL = '/user/add-money/manual/input-fields?alias='.addDBaseURl();

  //=>  Manual Gateway Post
  static String manualPaymentConfirmURL = '/user/add-money/manual/submit'.addBaseURl();

  //=>  TopUp Get
  static String topUpDetectOperator = '/user/mobile-topup/automatic/check-operator?'.addDBaseURl();

  //=>  TopUp Post
  static String topUpPayConfirmedURL = '/user/mobile-topup/automatic/pay'.addDBaseURl();

  //=>  KYC Get
  static String kycInfoURL = '/authorize/kyc/input-fields'.addDBaseURl();

  //=>  KYC Post URL
  static String kycSubmitURL = '/authorize/kyc/submit'.addDBaseURl();

  //=> Get My Gift Card
  static String myGiftCardURL = '/user/gift-card/'.addDBaseURl();

  //=> Get All Gift Card
  static String allGiftCardURL = '/user/gift-card/all'.addDBaseURl();

  //=> Gift Card Search URL
  static String giftCardSearchURL = '/user/gift-card/search/?country='.addDBaseURl();


  //=> Gift Card Oder URL
  static String giftCardOrderURL = '/user/gift-card/order'.addDBaseURl();

  //=> Gift Card Details URL
  static String giftCardDetailsURL = '/user/gift-card/details/?product_id='.addDBaseURl();

  //=> Two fa get
  static String twoFAInfoURL = '/authorize/google/2fa/status'.addDBaseURl();

  //=> Two fa Update
  static String twoFAUpdateURL = '/authorize/google/2fa/status-update'.addDBaseURl();

  //=> Two fa Update
  static String twoFAVerifyURL = '/authorize/google/2fa/verify'.addDBaseURl();







  static String registerOtpResendURL = '/user/email/resend/code'.addBaseURl();
  static String registerSmsCodeVerifyURL = '/user/sms/otp/verify'.addBaseURl();
  static String registerSmsCodeResendURL = '/user/sms/resend/code'.addBaseURl();

}
