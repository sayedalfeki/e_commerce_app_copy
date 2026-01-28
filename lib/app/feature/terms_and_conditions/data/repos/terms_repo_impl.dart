import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/data_sources/local/local_terms_data_source_contract.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_content.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_section.dart';
import 'package:flower_app/app/feature/terms_and_conditions/domain/repos/terms_repo_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: TermsRepoContract)
class TermsRepoImpl implements TermsRepoContract{
  LocalTermsDataSourceContract localTermsDataSourceContract;
  TermsRepoImpl(this.localTermsDataSourceContract);
  @override
  Future<BaseResponse<List<TermsSection>>> getTermsAndConditions() async{
    final response=await localTermsDataSourceContract.getTermsAndConditions();
    switch(response){
      
      case SuccessResponse<TermsContent>():
        return SuccessResponse<List<TermsSection>>(data: response.data.termsAndConditions);
      case ErrorResponse<TermsContent>():
        return ErrorResponse<List<TermsSection>>(error: response.error);
    }
  }

}