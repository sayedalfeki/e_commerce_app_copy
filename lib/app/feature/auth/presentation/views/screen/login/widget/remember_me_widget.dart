import 'package:flutter/material.dart';

import '../../../../../../../../l10n/app_localizations.dart';
import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/values_manager.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../controller/remember_controller.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({super.key, required this.rememberController});

  final RememberController rememberController;

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  @override
  void initState() {
    super.initState();
    widget.rememberController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Checkbox(
            value: widget.rememberController.rememberMe,
            onChanged: (value) {
              widget.rememberController.changeRememberMe();
            },
          ),
          Flexible(
            child: Text(
              AppLocalizations.of(context)!.rememberMe,
              style: AppTheme.lightTheme.textTheme.bodySmall!.copyWith(
                fontSize: AppSize.s14,
                fontWeight: FontWeights.regular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
