import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../domain/request/verify_otp_request.dart';

import '../../view_model/verify_otp_intent.dart';
import '../../view_model/verify_otp_view_model.dart';
import 'otp_input_fields.dart';
import 'resend_code_text_button.dart';

class VerifyOtpBody extends StatefulWidget {
  final StreamController<ErrorAnimationType> errorController;
  final String email;
  final VerifyOtpViewModel verifyOtpCubit;

  const VerifyOtpBody({
    super.key,
    required this.verifyOtpCubit,
    required this.errorController,
    required this.email,
  });

  @override
  State<VerifyOtpBody> createState() => _VerifyOtpBodyState();
}

class _VerifyOtpBodyState extends State<VerifyOtpBody> {
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '',
        //  LocaleKeys.emailVerification,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
           ' LocaleKeys.verifyOtpDescription',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 32),
        OtpInputFields(
          onCompleted: (code) {
            widget.verifyOtpCubit.doIntent(VerifyOtpAction(VerifyOtpRequest(resetCode: code)));
          },
          errorController: widget.errorController,
        ),
        BlocBuilder(
          bloc: widget.verifyOtpCubit,
          builder:
              (context, state) =>
                  // state is VerifyOtpFailure
                  //     ? Row(
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       children: [
                  //         const Icon(
                  //           Icons.error_outline_rounded,
                  //           color: AppColor.error,
                  //           size: 16,
                  //         ),
                  //         const SizedBox(width: 4),
                  //         Text(
                  //           LocaleKeys.invalidCode,
                  //           style: AppTextStyle.errorNormal14,
                  //         ),
                  //       ],
                  //     )
                      SizedBox(),
        ),
        ResendCodeTextButton(
          onPressed:(){}
              // () => widget.verifyOtpCubit.doIntent(
              //  // VerifyOtpResendOtpClickIntent(widget.email),
              // ),
        ),
      ],
    ),
  );
}
