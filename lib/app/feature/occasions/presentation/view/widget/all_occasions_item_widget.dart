import 'package:flutter/material.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/theme/app_theme.dart';

class AllOccasionsItemWidget extends StatelessWidget {
  const AllOccasionsItemWidget({
    super.key,
    required this.itemName,
    this.isSelected = false,
  });

  final String itemName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSize.s4),
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.s12,
        vertical: AppSize.s4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      child: Column(
        children: [
          Text(
            itemName,
            style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
              color: isSelected ? AppColors.primaryColor : AppColors.grayColor,
            ),
          ),
          // Container(
          //   height: AppSize.s4,
          //   width: AppSize.s50,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(AppSize.s10),
          //     color: isSelected?AppColors.primaryColor:AppColors.grayColor
          //   )
          // )
        ],
      ),
    );
  }
}
