import 'dart:async';


import 'package:flower_app/app/feature/forget_password/presentation/verify_otp/view_model/verify_otp_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/custom_widgets/custom_app_bar.dart';

import '../view_model/verify_otp_state.dart';
import '../view_model/verify_otp_view_model.dart';
import 'widgets/verify_otp_body.dart';

class VerifyOtpScreen extends StatelessWidget {
  final String email;
  const VerifyOtpScreen(this.email, {super.key});
  @override
  Widget build(BuildContext context) {
    VerifyOtpViewModel verifyOtpCubit = getIt<VerifyOtpViewModel>();
     final StreamController<ErrorAnimationType> errorController =
        StreamController<ErrorAnimationType>();
    return BlocBuilder<VerifyOtpViewModel, VerifyOtpState>(
      bloc: verifyOtpCubit,

      builder:
          (context, state) => Scaffold(
            appBar: CustomAppBar(
              text: '',
              onLeadingIconClicked: () {
                verifyOtpCubit.doIntent(BackNavigation());
              },
            ),
            body: Stack(
              children: [
                VerifyOtpBody(
                  email: email,
                  errorController: errorController,
                  verifyOtpCubit: verifyOtpCubit,
                ),

              ],
            ),
          ),
    );
  }
}
