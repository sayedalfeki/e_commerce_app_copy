
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/core/validation/app_validators.dart';
import 'package:flutter/material.dart';

import '../../../../domain/request/forget_password_request.dart';
import '../../view_model/forget_password_intent.dart';
import '../../view_model/forget_password_view_model.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  final ForgetPasswordViewModel forgetPasswordViewModel;
  final TextEditingController emailController;

  const ForgetPasswordScreenBody({
    super.key,
    required this.forgetPasswordViewModel,
    required this.emailController,
  });

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
    child: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocale(context).forgetPassword,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              AppLocale(context).forgetPasswordQuote,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 32),
          TextFormField(
            controller: widget.emailController,
            decoration: InputDecoration(
              hintText: AppLocale(context).enterYourEmail,
              labelText: AppLocale(context).email,
            ),
            validator: (value) => AppValidators.validateEmail(value, context),
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                widget.forgetPasswordViewModel.doIntent(
                  ForgetPasswordAction(
                    ForgetPasswordRequest(email: widget.emailController.text),
                  ),
                );
              }
            },
            child: Text(AppLocale(context).continueTxt),
          ),
        ],
      ),
    ),
  );
}
