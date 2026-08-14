import 'package:academic_elite/config/routes/base_routes.dart';
import 'package:academic_elite/features/auth/presentation/views/create_new_password_view.dart';
import 'package:academic_elite/features/auth/presentation/views/forgot_password_view.dart';
import 'package:academic_elite/features/auth/presentation/views/login_view.dart';
import 'package:academic_elite/features/auth/presentation/views/otp_verification_view.dart';
import 'package:academic_elite/features/auth/presentation/views/register_success_view.dart';
import 'package:academic_elite/features/auth/presentation/views/register_view.dart';
import 'package:academic_elite/features/language/presentation/views/language_view.dart';
import 'package:academic_elite/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:academic_elite/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String language = '/language';
  static const String authOptionsView = '/auth-options';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String onboardingView = '/onboarding';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerification = '/otp-verification';
  // static const String createNewPassword = '/create-new-password';
  // static const String createPassword = '/create-password';
  static const String createNewPassword = '/create-new-password';
  static const String registerSuccess = '/register-success';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return BaseRoute(page: const SplashView());

      case language:
        return BaseRoute(page: LanguageView());
      case onboardingView:
        return BaseRoute(page: const OnboardingView());

    case register:
  return BaseRoute(
    page: const RegisterView(),
  );

case registerSuccess:
  return BaseRoute(
    page: const RegisterSuccessView(),
  );

      // case home:
      //   return BaseRoute(page: const HomeView());

      case login:
        return BaseRoute(page: const LoginView());

      case createNewPassword:
        final email = settings.arguments as String;

        return BaseRoute(page: CreateNewPasswordView(email: email));

      // case register:
      //   return BaseRoute(page: const RegisterView());

      case forgotPassword:
        return BaseRoute(page: const ForgotPasswordView());

     case otpVerification:
  final String email = settings.arguments as String;

  return BaseRoute(
    page: OtpVerificationView(
      email: email,
    ),
  );

      // case createPassword:
      //   return BaseRoute(page: const CreatePasswordView());

      default:
        return BaseRoute(
          page: const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
