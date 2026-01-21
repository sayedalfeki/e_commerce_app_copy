import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_locale.dart';
import '../../controller/gender_controller.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({
    super.key,
    required this.genderController,
    this.onChanged,
  });

  final GenderController genderController;
  final void Function()? onChanged;

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.genderController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(AppLocale(context).gender)),
        Expanded(
          child: RadioListTile<String>(
            title: Text(AppLocale(context).female),
            value: 'female',
            groupValue: widget.genderController.gender,
            onChanged: (value) {
              widget.genderController.changeGender(value!);
              widget.onChanged?.call();
            },
          ),
        ),
        Expanded(
          child: RadioListTile<String>(
            title: Text(AppLocale(context).male),
            value: 'male',
            groupValue: widget.genderController.gender,
            onChanged: (value) {
              widget.genderController.changeGender(value!);
            },
          ),
        ),
      ],
    );
  }
}
