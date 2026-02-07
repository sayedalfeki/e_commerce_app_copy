import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/start/domain/language_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../domain/language_data_source_contract.dart';

@Injectable(as: LanguageRepoContract)
class LanguageRepoImpl extends LanguageRepoContract {
  final LanguageDataSourceContract _languageDataSourceContract;

  LanguageRepoImpl(this._languageDataSourceContract);

  @override
  Future<BaseResponse<bool>> addLanguage(String lang) {
    return _languageDataSourceContract.addLanguage(lang);
  }

  @override
  String? getLanguage() {
    return _languageDataSourceContract.getLanguage();
  }
}
