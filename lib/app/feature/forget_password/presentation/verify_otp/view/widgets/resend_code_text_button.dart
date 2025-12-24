import 'package:flutter/material.dart';


import '../../../../../../core/resources/app_colors.dart';

class ResendCodeTextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ResendCodeTextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('LocaleKeys.didNotReceiveCode'),
      TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          'LocaleKeys.resend',
          style: TextStyle(
            color: AppColors.primaryColor,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryColor,
          ),
        ),
      ),
    ],
  );
}
