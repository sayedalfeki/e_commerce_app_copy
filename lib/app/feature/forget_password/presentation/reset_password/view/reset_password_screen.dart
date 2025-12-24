import 'package:flower_app/app/core/custom_widgets/custom_app_bar.dart';
import 'package:flower_app/app/feature/forget_password/presentation/reset_password/view_model/reset_password_intent.dart';
import 'package:flower_app/app/feature/forget_password/presentation/reset_password/view_model/reset_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/di/di.dart';
import '../view_model/reset_password_state.dart';
import 'widgets/reset_password_body.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;

  const ResetPasswordScreen(this.email, {super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final ResetPasswordViewModel _resetPasswordViewModel = getIt.get<ResetPasswordViewModel>();
    return BlocBuilder<ResetPasswordViewModel, ResetPasswordState>(
      bloc: _resetPasswordViewModel,

      builder:
          (context, state) => Scaffold(
            appBar:CustomAppBar(
              onLeadingIconClicked: () {
                _resetPasswordViewModel.doIntent(
                  BackNavigationAction(),
                );
              }, text: 'password',
            ),
            body: Stack(
              children: [
                ResetPasswordBody(_resetPasswordViewModel, email: widget.email),

              ],
            ),
          ),
    );
  }
}
