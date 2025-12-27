import 'package:flower_app/app/core/routes/app_route.dart';
import 'package:flower_app/app/feature/auth/presentation/views/screen/forget_password_screen/forget_password_screen.dart';
import 'package:flower_app/app/feature/auth/presentation/views/screen/login/login_Screen.dart';
import 'package:flower_app/app/feature/auth/presentation/views/screen/register/register_Screen.dart';
import 'package:flower_app/app/feature/home/presentation/views/screen/home_screen.dart';
import 'package:flower_app/app/feature/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

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
