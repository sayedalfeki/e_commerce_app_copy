import 'dart:async';

import 'package:flower_app/app/core/routes/app_route.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/feature/forget_password/presentation/verify_otp/view_model/verify_otp_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/custom_widgets/custom_app_bar.dart';
import '../view_model/verify_otp_event.dart';
import '../view_model/verify_otp_state.dart';
import '../view_model/verify_otp_view_model.dart';
import 'widgets/verify_otp_body.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  const VerifyOtpScreen(this.email, {super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final VerifyOtpViewModel _verifyOtpViewModel = getIt<VerifyOtpViewModel>();
  final StreamController<ErrorAnimationType> _errorController =
  StreamController<ErrorAnimationType>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyOtpViewModel.cubitStream.listen((event) {
      if (event is BacskNavigationEvent) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _errorController.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpViewModel, VerifyOtpState>(
      bloc: _verifyOtpViewModel,
      listener: (context, state) {
        if (state.verifyOtpState.error != null) {
          _errorController.add(ErrorAnimationType.shake);
        }
        if (state.verifyOtpState.success != null) {
          Navigator.pushNamed(
              context, Routes.resetPassword, arguments: widget.email);
        }
      },
      builder:
          (context, state) =>
          Scaffold(
            appBar: CustomAppBar(
              text: AppLocale(context).password,
              onLeadingIconClicked: () {
                _verifyOtpViewModel.doIntent(BackNavigation());
              },
            ),
            body: Stack(
              children: [
                VerifyOtpBody(
                  email: widget.email,
                  errorController: _errorController,
                  verifyOtpViewModel: _verifyOtpViewModel,
                  verifyOtpState: state,
                ),
                state.verifyOtpState.isLoading == true ?
                const Center(child: CircularProgressIndicator()) :
                const SizedBox.shrink()
                ,

              ],
            ),
          ),
    );
  }
}
