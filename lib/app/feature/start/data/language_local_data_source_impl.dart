import 'package:flower_app/app/config/api_utils/api_utils.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/core/consts/app_consts.dart';
import 'package:flower_app/app/feature/start/domain/language_data_source_contract.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: LanguageDataSourceContract)
class LanguageLocalDataSourceImpl extends LanguageDataSourceContract {
  final SharedPreferences _sharedPreferences;

  LanguageLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<BaseResponse<bool>> addLanguage(String lang) => executeApi(
    () => _sharedPreferences.setString(AppConsts.languageKey, lang),
  );

  @override
  String? getLanguage() {
    return _sharedPreferences.getString(AppConsts.languageKey);
  }
}
