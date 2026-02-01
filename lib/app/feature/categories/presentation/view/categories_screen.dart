import 'package:flower_app/app/core/reusable_widgets/custom_app_bar.dart';
import 'package:flower_app/app/feature/categories/presentation/view/widget/occasions_body_Widget.dart';
import 'package:flower_app/app/feature/categories/presentation/view_model/categories_event.dart';
import 'package:flower_app/app/feature/categories/presentation/view_model/categories_intent.dart';

import 'package:flower_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../../../../core/routes/app_route.dart';
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
    categoriesViewModel.cubitStream.listen((event) {
      switch (event) {
        case NavigateToProductDetailsEvent():
          if (mounted) {
            Navigator.pushNamed(
              context,
              Routes.productDetails,
              arguments: event.productId,
            );
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesViewModel, CategoriesState>(
      bloc: categoriesViewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            onLeadingIconClicked: () {},
            text: AppLocalizations.of(context)?.categories ?? '',
            title: AppLocalizations.of(context)?.categoriesTitle ?? '',
          ),
          body: CategoriesBodyWidget(
            state: state,
            categoriesViewModel: categoriesViewModel,
          ),
        );
      },
    );
  }
}
