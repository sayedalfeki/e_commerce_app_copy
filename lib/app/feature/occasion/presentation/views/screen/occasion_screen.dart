import 'package:flower_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OccasionScreen extends StatelessWidget {
  const OccasionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppLocalizations.of(context)!.occasion),
      ),
    );
  }
}