import 'package:flower_app/app/core/reusable_widgets/custom_app_bar.dart';
import 'package:flower_app/app/feature/occasions/presentation/view/widget/occasions_body_Widget.dart';
import 'package:flower_app/app/feature/occasions/presentation/view_model/occasions_view_model.dart';
import 'package:flower_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../view_model/occasions_intent.dart';
import '../view_model/occasions_state.dart';

class OccasionsScreen extends StatefulWidget {
  const OccasionsScreen({super.key});

  @override
  State<OccasionsScreen> createState() => _OccasionsScreenState();
}

class _OccasionsScreenState extends State<OccasionsScreen> {
  final OccasionsViewModel occasionsViewModel = getIt<OccasionsViewModel>();

  @override
  void initState() {
    super.initState();
    occasionsViewModel.doIntent(AllOccasionsIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OccasionsViewModel, OccasionsState>(
      bloc: occasionsViewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            onLeadingIconClicked: () {},
            text: AppLocalizations.of(context)?.occasions ?? '',
            title: AppLocalizations.of(context)?.occasions_title,
          ),
          body: OccasionsBodyWidget(
            state: state,
            occasionsViewModel: occasionsViewModel,
          ),
        );
      },
    );
  }
}
