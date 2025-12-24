import 'package:flower_app/app/core/validation/app_validators.dart';
import 'package:flower_app/app/feature/forget_password/domain/request/reset_password_request.dart';
import 'package:flower_app/app/feature/forget_password/presentation/reset_password/view_model/reset_password_intent.dart';
import 'package:flower_app/app/feature/forget_password/presentation/reset_password/view_model/reset_password_view_model.dart';
import 'package:flutter/material.dart';


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
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
    child: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'LocaleKeys.resetPasswordLabel',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'LocaleKeys.resetPasswordDescription',
                textAlign: TextAlign.center,

              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: passwordController,
              validator:(value) => AppValidators.validateEmail(value, context),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordConfirmController,
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
              child:Text('ocaleKeys.resetPasswordLabel'),
            ),
          ],
        ),
      ),
    ),
  );
}
