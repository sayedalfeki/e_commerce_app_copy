import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view/widget/language_container_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/app_colors.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocale(context).change_language,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          LanguageContainerWidget(
            value: 'ar',
            title: AppLocale(context).arabic,
          ),
          const SizedBox(height: 10),
          LanguageContainerWidget(
            value: 'en',
            title: AppLocale(context).english,
          ),
        ],
      ),
    );
  }
}
