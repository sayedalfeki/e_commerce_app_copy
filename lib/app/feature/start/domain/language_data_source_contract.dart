import '../../../config/base_response/base_response.dart';

abstract class LanguageDataSourceContract {
  String? getLanguage();

  Future<BaseResponse<bool>> addLanguage(String lang);
}
