import 'package:flower_app/app/feature/start/domain/language_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSavedLanguageUseCase {
  final LanguageRepoContract _languageRepoContract;

  GetSavedLanguageUseCase(this._languageRepoContract);

  String? invoke() {
    return _languageRepoContract.getLanguage();
  }
}
