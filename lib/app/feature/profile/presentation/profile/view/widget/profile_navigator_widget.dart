import 'package:flower_app/app/feature/about_app/presentation/views/screen/about_app_screen.dart';
import 'package:flower_app/app/feature/profile/presentation/update_profile/view/update_profile_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/routes/app_route.dart';
import '../../../../domain/model/user_entity.dart';
import '../profile_screen.dart';

class ProfileNavigatorWidget extends StatefulWidget {
  const ProfileNavigatorWidget({super.key});

  @override
  State<ProfileNavigatorWidget> createState() => _ProfileNavigatorWidgetState();
}

class _ProfileNavigatorWidgetState extends State<ProfileNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.updateProfile:
            return MaterialPageRoute(
              builder: (_) {
                final UserEntity user = settings.arguments as UserEntity;
                return UpdateProfileWidget(user: user);
              },
            );
            case Routes.aboutApp:
            return MaterialPageRoute(
              builder: (_) {
                return const AboutAppScreen();
              },
            );
          default:
            return MaterialPageRoute(builder: (_) => const ProfileScreen());
        }
      },
    );
  }
}
