import 'package:flower_app/app/core/reusable_widgets/show_dialog_utils.dart';
import 'package:flower_app/app/core/routes/app_route.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view/widget/profile_widget.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view_model/profile_event.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view_model/profile_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/di/di.dart';
import '../view_model/profile_state.dart';
import '../view_model/profile_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileViewModel viewModel = getIt<ProfileViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.doIntent(GetProfileAction());
    viewModel.cubitStream.listen((event) {
      switch (event) {
        case NavigateToEditProfileEvent():
          if (mounted) {
            Navigator.pushNamed(
              context,
              Routes.updateProfile,
              arguments: viewModel.state.profileState.success,
            ).then((value) => viewModel.doIntent(GetProfileAction(),));
          }
        case LogoutUserEvent():
          if (mounted) {
            ShowDialogUtils.showMessage(
              context,
              content: AppLocale(context).logOutAction,
              nigActionName: AppLocale(context).no,
              nigAction: () {
                Navigator.pop(context);
              },
              posActionName: AppLocale(context).yes,
              posAction: () {},
            );
          }
          break;
        case NavigateToAddressScreenEvent():
          if (mounted) {
            Navigator.pushNamed(context, Routes.userAddress);
          }
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, ProfileState>(
      bloc: viewModel,
      builder: (context, state) =>
          ProfileWidget(profileViewModel: viewModel, profileState: state),
    );
  }
}
