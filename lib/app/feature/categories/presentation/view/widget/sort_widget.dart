import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/feature/categories/presentation/view/controller/sort_controller.dart';
import 'package:flower_app/app/feature/product/domain/request/query_product_request.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/app_colors.dart';

class SortWidget extends StatefulWidget {
  const SortWidget({super.key, required this.sortController});

  final SortController sortController;

  @override
  State<SortWidget> createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  @override
  void initState() {
    super.initState();
    widget.sortController.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Column(
                children: [
                  Text(AppLocale(context).lowestPrice),
                  SizedBox(height: 15),
                  Text(AppLocale(context).highestPrice),
                  SizedBox(height: 15),
                  Text(AppLocale(context).newArrival),
                  SizedBox(height: 15),
                  Text(AppLocale(context).old),
                  SizedBox(height: 15),
                  Text(AppLocale(context).discount),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  RadioGroup<Sort>(
                    groupValue: widget.sortController.productSort,
                    onChanged: (val) {
                      setState(() {
                        widget.sortController.changeProductSort(val!);
                      });
                    },
                    child: Column(
                      children: [
                        Radio<Sort>(value: Sort.priceAsc),
                        Radio<Sort>(value: Sort.priceDesc),
                        Radio<Sort>(value: Sort.newSort),
                        Radio<Sort>(value: Sort.old),
                        Radio<Sort>(value: Sort.discount),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.tune, size: 30),
                SizedBox(width: 10),
                Text(
                  AppLocale(context).filter,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
