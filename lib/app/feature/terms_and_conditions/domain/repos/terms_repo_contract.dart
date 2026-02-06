import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_section.dart';

abstract class TermsRepoContract {
  Future<BaseResponse<List<TermsSection>>> getTermsAndConditions();
}