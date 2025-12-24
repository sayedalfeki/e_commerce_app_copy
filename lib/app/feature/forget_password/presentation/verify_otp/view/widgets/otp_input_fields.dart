import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInputFields extends StatelessWidget {
  final void Function(String code) onCompleted;
  final StreamController<ErrorAnimationType> errorController;

  const OtpInputFields({
    super.key,
    required this.onCompleted,
    required this.errorController,
  });

  @override
  Widget build(BuildContext context) => PinCodeTextField(
    appContext: context,
    errorAnimationController: errorController,
    length: 6,
    keyboardType: TextInputType.number,
    // cursorColor: AppColor.baseBlack,
    // animationType: AnimationType.fade,
    // pinTheme: PinTheme(
    //   shape: PinCodeFieldShape.box,
    //   borderRadius: BorderRadius.circular(8),
    //   fieldHeight: 68,
    //   fieldWidth: 50,
    //   activeColor: AppColor.baseBlue,
    //   inactiveColor: AppColor.baseBlue.withAlpha(1),
    //   selectedColor: AppColor.baseBlue,
    //   activeFillColor: Colors.white,
    //   inactiveFillColor: AppColor.baseBlue.withAlpha(28),
    //   selectedFillColor: Colors.white,
    //   errorBorderColor: AppColor.error,
    //   borderWidth: 1,
    // ),
    enableActiveFill: true,
    onCompleted: (value) => onCompleted(value),
    errorAnimationDuration: 400,
    animationDuration: const Duration(milliseconds: 300),
  );
}
