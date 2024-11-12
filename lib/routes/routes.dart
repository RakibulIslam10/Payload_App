import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:payloadui/views/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:payloadui/views/auth/reset_password_screen/reset_password_screen.dart';
import 'package:payloadui/views/auth/twofa_verification/two_fa_otp_verify/two_fa_otp_verify_screen.dart';
import 'package:payloadui/views/drawer_menu_screen/drawer_menu_mobile_layout_screen.dart';
import 'package:payloadui/views/news_and_blog_screen/news_and_blog_screen.dart';
import 'package:payloadui/views/purchase_history_screen/purchase_history_screen.dart';
import 'package:payloadui/views/recharge/recharge_history_screen/recharge_history_screen.dart';
import 'package:payloadui/views/recharge/recharge_preview_screen/recharge_preview_screen.dart';
import 'package:payloadui/views/service/data_bundle/offer_details_screen/offer_details_screen.dart';
import 'package:payloadui/views/wallet_recharge_screen/congratulation_screen.dart';
import 'package:payloadui/views/wallet_recharge_screen/manual_recharge/manual_gateway_recharge_screen.dart';
import 'package:payloadui/views/wallet_recharge_screen/preview/wallet_recharge_preview_screen.dart';
import 'package:payloadui/views/wallet_recharge_screen/wallet_recharge_screen.dart';
import '../views/auth/change_password_screen/change_password_screen.dart';
import '../views/auth/kyc/kyc_verification_screen/kyc_verification_screen.dart';
import '../views/auth/otp_verification_screen/forgot_password_otp_verify/forgot_password_otp_verify_Screen.dart';
import '../views/auth/otp_verification_screen/otp_verification/otp_verification_screen.dart';
import '../views/auth/registration_screen/registration_screen.dart';
import '../views/auth/sign_in_screen/sign_in_screen.dart';
import '../views/auth/twofa_verification/twofa_verification_screen.dart';
import '../views/gift_card/add_gift_card_screen/add_gift_card_screen.dart';
import '../views/gift_card/gift_card_details_screen/gift_card_oder_screen.dart';
import '../views/gift_card/gift_card_screen/gift_card_screen.dart';
import '../views/navigation_screen/navigation_screen.dart';
import '../views/onboard_screen/onboard_screen.dart';
import '../views/profile/update_profile_screen/update_profile_screen.dart';
import '../views/service/data_bundle/data_bundles_screen/data_bundles_screen.dart';
import '../views/service/flexiplan_screen/flxiplan_screen.dart';
import '../views/splash_screen/splash_screen.dart';
part '../routes/route_pages.dart';

class Routes {
  static var list = RoutePageList.list;

  static const String splashScreen = '/splash_screen';
  static const String onboardScreen = '/onboard_screen';
  static const String signInScreen = '/sign_in_screen';
  static const String otpVerificationScreen = '/otp_verification_screen';
  static const String navigationScreen = '/navigation_screen';
  static const String offersScreen = '/offers_screen';
  static const String offerDetailsScreen = '/offer_details_screen';
  static const String servicesScreen = '/services_screen';
  static const String giftCardScreen = '/gift_card_screen';
  static const String flexiPlanScreen = '/flexiplan_screen';
  static const String purchaseHistoryScreen = '/purchase_history_screen';
  static const String registrationScreen = '/registration_screen';
  static const String dataBundlesScreen = '/data_bundles_screen';
  static const String rechargePreviewScreen = '/recharge_preview_screen';
  static const String addGiftCardScreen = '/add_gift_card_screen';
  static const String giftCardDetailsScreen = '/gift_card_details_screen';
  static const String newsAndBlogScreen = '/news_and_blog_screen';
  static const String walletRechargeScreen = '/wallet_recharge_screen';
  static const String changePasswordScreen = '/change_password_screen';
  static const String twofaVerificationScreen = '/twofa_verification_screen';
  static const String kycVerificationScreen = '/kyc_verification_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String rechargeHistoryScreen = '/recharge_history_screen';
  static const String kycPendingOrVerifyScreen =
      '/kyc_pending_or_verify_screen';
  static const String updateProfileScreen = '/update_profile_screen';
  static const String forgotPasswordOtpVerifyScreen =
      '/forgot_password_otp_verify_screen';
  static const String resetPasswordScreen = '/reset_password_screen';
  static const String walletRechargePreviewScreen =
      '/wallet_recharge_preview_screen';
  static const String webViewScreen = '/web_view_screen';
  static const String manualGatewayRechargeScreen =
      '/manual_gateway_recharge_screen';
  static const String congratulationScreen = '/congratulation_screen';
  static const String dowerScreen = '/drawer_menu_screen';
  static const String twoFaOtpVerifyScreen = '/two_fa_otp_verify_screen';
}
