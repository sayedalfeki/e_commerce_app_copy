import 'package:flower_app/app/feature/categories/presentation/view/widget/categories_body_Widget.dart';
import 'package:flower_app/app/feature/categories/presentation/view_model/categories_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../view_model/categories_state.dart';
import '../view_model/categories_view_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesViewModel categoriesViewModel = getIt<CategoriesViewModel>();

  @override
  void initState() {
    super.initState();
    categoriesViewModel.doIntent(CategoriesAction());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesViewModel, CategoriesState>(
      bloc: categoriesViewModel,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: CategoriesBodyWidget(
              state: state,
              categoriesViewModel: categoriesViewModel,
            ),
          ),
        );
      },
    );
  }
}
