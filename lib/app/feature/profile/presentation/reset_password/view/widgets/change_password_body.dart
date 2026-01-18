import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/validation/app_validators.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_locale.dart';
import '../../../../domain/request/change_password_request.dart';
import '../../view_model/change_password_intent.dart';
import '../../view_model/change_password_view_model.dart';

class ResetPasswordBody extends StatefulWidget {
  final ChangePasswordViewModel _changePasswordViewModel;

  const ResetPasswordBody(this._changePasswordViewModel, {super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    currentPasswordController.dispose();
    passwordConfirmController.dispose();
    newPasswordController.dispose();
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
            TextFormField(
              controller: currentPasswordController,
              decoration: InputDecoration(
                hintText: AppLocale(context).enterYourPassword,
                labelText: AppLocale(context).password,
              ),
              validator: (value) =>
                  AppValidators.validatePassword(value, context),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: newPasswordController,
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
              validator: (value) => AppValidators.validateConfirmPassword(
                value,
                newPasswordController.text,
                context,
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  widget._changePasswordViewModel.doIntent(
                    ChangePasswordAction(
                      ChangePasswordRequest(
                        password: currentPasswordController.text,
                        newPassword: passwordConfirmController.text,
                      ),
                    ),
                  );
                }
              },
              child: Text(
                AppLocale(context).confirm,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
