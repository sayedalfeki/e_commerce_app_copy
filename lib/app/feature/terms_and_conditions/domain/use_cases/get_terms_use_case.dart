import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_section.dart';
import 'package:flower_app/app/feature/terms_and_conditions/domain/repos/terms_repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetTermsUseCase {
  final TermsRepoContract _termsRepoContract;
  GetTermsUseCase(this._termsRepoContract);
  Future<BaseResponse<List<TermsSection>>> call() async{
    return _termsRepoContract.getTermsAndConditions();
  }
}