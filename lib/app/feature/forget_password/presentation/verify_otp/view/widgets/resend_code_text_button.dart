import 'package:flutter/material.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/utils/app_locale.dart';

class ResendCodeTextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ResendCodeTextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(AppLocale(context).receiveCodeQuestion,
        style: Theme
            .of(context)
            .textTheme
            .bodyLarge,
      ),
      TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
            AppLocale(context).resend,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
            )

        ),
      ),
    ],
  );
}
