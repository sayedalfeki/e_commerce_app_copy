import 'package:flower_app/app/core/resources/assets_manager.dart';
import 'package:flower_app/app/core/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 3500), () {
      Navigator.pushReplacementNamed(context, Routes.productDetails);
    });
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AssetsSvg.logoSvg, width: 200).animate().scale(
          delay: Duration(milliseconds: 1500),
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }
}
