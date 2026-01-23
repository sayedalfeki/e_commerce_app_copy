import 'package:flower_app/app/feature/start/view_model/start_view_model.dart';
import 'package:flower_app/main.dart';
import 'package:flutter/material.dart';

import '../../../config/di/di.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _MyAppState();
}

class _MyAppState extends State<StartScreen> with WidgetsBindingObserver {
  final StartViewModel startViewModel = getIt<StartViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    startViewModel.clearToken();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}
