import 'package:flower_app/app/config/base_response/base_response.dart';

abstract class LanguageRepoContract {
  String? getLanguage();

  Future<BaseResponse<bool>> addLanguage(String lang);
}
