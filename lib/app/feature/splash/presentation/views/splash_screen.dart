import 'package:flower_app/app/core/resources/assets_manager.dart';
import 'package:flower_app/app/core/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 3500), () {
      Navigator.pushReplacementNamed(
          context, Routes.forgetPassword, arguments: 'selfeki207@gmail.com');
    });
    return Scaffold(
      body: Center(
        child: Image.asset(AssetsIcons.logo, width: 200).animate().scale(
          delay: Duration(milliseconds: 1500),
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }
}
