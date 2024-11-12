part of '../routes/routes.dart';

class RoutePageList {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => const OnboardScreen(),
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.otpVerificationScreen,
      page: () => const OtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.navigationScreen,
      page: () => NavigationScreen(),
    ),
    GetPage(
      name: Routes.flexiPlanScreen,
      page: () => const FlxiplanScreen(),
    ),
    GetPage(
      name: Routes.registrationScreen,
      page: () => const RegistrationScreen(),
    ),
    GetPage(
      name: Routes.offerDetailsScreen,
      page: () => const OfferDetailsScreen(),
    ),
    GetPage(
      name: Routes.dataBundlesScreen,
      page: () => const DataBundlesScreen(),
    ),
    GetPage(
      name: Routes.rechargePreviewScreen,
      page: () => const RechargePreviewScreen(),
    ),
    GetPage(
      name: Routes.giftCardScreen,
      page: () => const GiftCardScreen(),
    ),
    GetPage(
      name: Routes.addGiftCardScreen,
      page: () => const GiftCardSelectScreen(),
    ),
    GetPage(
      name: Routes.giftCardDetailsScreen,
      page: () => const GiftCardDetailsScreen(),
    ),
    GetPage(
      name: Routes.newsAndBlogScreen,
      page: () => const NewsAndBlogScreen(),
    ),
    GetPage(
      name: Routes.walletRechargeScreen,
      page: () => const WalletRechargeScreen(),
    ),
    GetPage(
      name: Routes.changePasswordScreen,
      page: () => const ChangePasswordScreen(),
    ),
    GetPage(
      name: Routes.twofaVerificationScreen,
      page: () => const TwofaVerificationScreen(),
    ),
    GetPage(
      name: Routes.kycVerificationScreen,
      page: () => const KycVerificationScreen(),
    ),
    GetPage(
      name: Routes.purchaseHistoryScreen,
      page: () => const PurchaseHistoryScreen(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: Routes.rechargeHistoryScreen,
      page: () => const RechargeHistoryScreen(),
    ),
    GetPage(
      name: Routes.updateProfileScreen,
      page: () => const UpdateProfileScreen(),
    ),
    GetPage(
      name: Routes.forgotPasswordOtpVerifyScreen,
      page: () => const ForgotPasswordOtpVerifyScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.walletRechargePreviewScreen,
      page: () => const WalletRechargePreviewScreen(),
    ),
    GetPage(
      name: Routes.manualGatewayRechargeScreen,
      page: () => const ManualGatewayRechargeScreen(),
    ),
    GetPage(
      name: Routes.dowerScreen,
      page: () => const MyDrawerMenu(),
    ),
    GetPage(
      name: Routes.twoFaOtpVerifyScreen,
      page: () => const TwoFaOtpVerifyScreen(),
    ),
  ];
}
