
import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialogUtils {
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocale(context).loading, style: Theme.of(context).textTheme.headlineMedium),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ),
          backgroundColor: Colors.white,
        );
      },
      barrierDismissible: false,
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
    BuildContext context, {
    String? Title,
    String? Content,
    String? PosActionName,
    Function? PosAction,
    String? NigActionName,
    Function? NigAction,
  }) {
    List<Widget> Actions = [];

    if (PosActionName != null) {
      Actions.add(
        TextButton(
          onPressed: () {
            PosAction == null ? Navigator.pop(context) : PosAction.call();
          },
          child: Text(PosActionName, style:Theme.of(context).textTheme.headlineMedium),
        ),
      );
    }
    if (NigActionName != null) {
      Actions.add(
        TextButton(
          onPressed: () {
            NigAction == null ? Navigator.pop(context) : NigAction.call();
          },
          child: Text(NigActionName, style: Theme.of(context).textTheme.headlineMedium),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(Title ?? "", style: Theme.of(context).textTheme.headlineMedium),
          content: Text(Content ?? '', style: Theme.of(context).textTheme.headlineMedium),
          actions: Actions,
          backgroundColor: Colors.white,
        );
      },
    );
  }
}
