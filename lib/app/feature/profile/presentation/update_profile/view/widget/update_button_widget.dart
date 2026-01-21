import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/feature/profile/presentation/update_profile/controller/update_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_locale.dart';

class UpdateButtonWidget extends StatefulWidget {
  const UpdateButtonWidget({
    super.key,
    required this.onPressed,
    required this.updateController,
  });

  final void Function() onPressed;
  final UpdateController updateController;

  @override
  State<UpdateButtonWidget> createState() => _UpdateButtonWidgetState();
}

class _UpdateButtonWidgetState extends State<UpdateButtonWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.updateController.isUpdate ? widget.onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.updateController.isUpdate
            ? AppColors.primaryColor
            : AppColors.grayColor,
      ),
      child: Text(AppLocale(context).update),
    );
  }
}
