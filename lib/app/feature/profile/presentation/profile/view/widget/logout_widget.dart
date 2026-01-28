import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/di/di.dart';
import '../../../../../home/presentation/view_model/home_intent.dart';
import '../../../../../home/presentation/view_model/home_view_model.dart';
import '../../view_model/profile_intent.dart';
import '../../view_model/profile_state.dart';

class LogoutWidget extends StatefulWidget {
  const LogoutWidget({super.key});

  @override
  State<LogoutWidget> createState() => _LogoutWidgetState();
}

class _LogoutWidgetState extends State<LogoutWidget> {
  final ProfileViewModel profileViewModel = getIt<ProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileViewModel, ProfileState>(
      bloc: profileViewModel,
      listener: (context, state) {
        if (state.isLogout != null || state.isLogout == true) {
          context.read<HomeViewModel>().doIntent(GetTokenAction());
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Text(AppLocale(context).logOutAction),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    profileViewModel.doIntent(LogoutUserAction());
                  },
                  child: Text(AppLocale(context).yes),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Text(AppLocale(context).no),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
