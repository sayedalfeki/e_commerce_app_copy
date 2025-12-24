import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/validation/app_validators.dart';
import 'package:flower_app/app/feature/forget_password/domain/request/reset_password_request.dart';
import 'package:flower_app/app/feature/forget_password/presentation/reset_password/view_model/reset_password_intent.dart';
import 'package:flower_app/app/feature/forget_password/presentation/reset_password/view_model/reset_password_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_locale.dart';
class ResetPasswordBody extends StatefulWidget {
  final String email;
  final ResetPasswordViewModel _resetPasswordViewModel;

  const ResetPasswordBody(
    this._resetPasswordViewModel, {
    super.key,
    required this.email,
  });

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
  }
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
    child: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(AppLocale(context).resetPassword,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(AppLocale(context).resetPasswordQuote,
                textAlign: TextAlign.center,

              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: AppLocale(context).enterYourPassword,
                labelText: AppLocale(context).password,
              ),
              validator: (value) =>
                  AppValidators.validatePassword(value, context),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordConfirmController,
                decoration: InputDecoration(
                  hintText: AppLocale(context).confirmPassword,
                  labelText: AppLocale(context).confirmPassword,
                ),
              validator:
                  (value) =>AppValidators.validateConfirmPassword(value,passwordController.text, context)

            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  widget._resetPasswordViewModel.doIntent(
                    ResetPasswordAction(
                      ResetPasswordRequest(
                      email:widget.email,
                      newPassword:passwordConfirmController.text,
                      )
                    ),
                  );
                }
              },
              child: Text(AppLocale(context).confirm,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                    color: AppColors.whiteColor,
                  )),
            ),
          ],
        ),
      ),
    ),
  );
}
