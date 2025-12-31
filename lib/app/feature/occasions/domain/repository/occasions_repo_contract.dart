import '../../../../config/base_response/base_response.dart';
import '../model/all_occasions_entity.dart';

abstract class OccasionsRepoContract {
  Future<BaseResponse<AllOccasionsEntity>> getAllOccasions();
}
