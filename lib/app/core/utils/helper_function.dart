import 'package:flower_app/app/config/base_error/custom_exceptions.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flutter/material.dart';

String getException(BuildContext context, Exception? exception) {
  String error = '';
  switch (exception) {
    case ConnectionError():
      error = AppLocale(context).connectionFailed;
      break;
    case ServerError():
      error = exception.message ?? '';
      break;
  }
  return error;
}