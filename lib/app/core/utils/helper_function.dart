import '../../config/base_error/custom_exceptions.dart';

String getException(Exception? exception) {
  String error = '';
  switch (exception) {
    case ConnectionError():
      error = exception.message ;
      break;
    case ServerError():
      error = exception.message ?? '';
      break;
  }
  return error;
}
