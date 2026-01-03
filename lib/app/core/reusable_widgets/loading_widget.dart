import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
    alignment: Alignment.center,
    child: Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.3),
        border: Border.all(color: AppColors.grayColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 130,
      height: 150,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColors.primaryColor,
            strokeWidth: 3,
          ),
          SizedBox(height: 16),
          Text(
            'Loading...',
            style: TextStyle(
              color: AppColors.grayColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
