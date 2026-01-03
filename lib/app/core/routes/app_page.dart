import 'package:flower_app/app/core/routes/app_route.dart';
import 'package:flower_app/app/feature/auth/presentation/views/screen/login/login_Screen.dart';
import 'package:flower_app/app/feature/home/presentation/views/screen/home_screen.dart';
import 'package:flower_app/app/feature/signup/presentation/views/signup_screen.dart';
import 'package:flower_app/app/feature/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/forget_password/presentation/forget_password/view/forget_password_screen.dart';
import '../../feature/forget_password/presentation/reset_password/view/reset_password_screen.dart';
import '../../feature/forget_password/presentation/verify_otp/view/verify_otp_screen.dart';
import '../../feature/occasions/presentation/view/occasions_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) =>  SignupScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
        case Routes.verifyOtp:
          String email = settings.arguments as String;
        return MaterialPageRoute(builder: (_) =>  VerifyOtpScreen(email));
      case Routes.resetPassword:
        String email = settings.arguments as String;
        return MaterialPageRoute(builder: (_) =>  ResetPasswordScreen(email));
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.occasions:
        return MaterialPageRoute(builder: (_) => OccasionsScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: Center(child: Text('No Route Found')),
      ),
    );
  }
}
