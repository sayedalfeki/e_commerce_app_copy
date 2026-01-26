import 'package:flower_app/app/feature/start/domain/language_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';

@injectable
class AddLanguageUseCase {
  final LanguageRepoContract _languageRepoContract;

  AddLanguageUseCase(this._languageRepoContract);

  Future<BaseResponse<bool>> invoke(String lang) {
    return _languageRepoContract.addLanguage(lang);
  }
}
