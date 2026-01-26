import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../start/presentation/view_model/start_view_model.dart';

class LanguageContainerWidget extends StatefulWidget {
  const LanguageContainerWidget({
    super.key,
    required this.value,
    required this.title,
  });

  final String title;
  final String value;

  @override
  State<LanguageContainerWidget> createState() =>
      _LanguageContainerWidgetState();
}

class _LanguageContainerWidgetState extends State<LanguageContainerWidget> {
  @override
  Widget build(BuildContext context) {
    StartViewModel startViewModel = Provider.of<StartViewModel>(context);

    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Radio<String>(
            value: widget.value,
            groupValue: startViewModel.language,
            onChanged: (value) {
              startViewModel.changeLanguage(value!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
