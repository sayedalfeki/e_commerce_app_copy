import 'package:flower_app/app/feature/occasions/data/model/all_occasions_response.dart';
import '../../../../config/base_response/base_response.dart';
abstract class OccasionsRemoteDataSourceContract {
  Future<BaseResponse<AllOccasionResponse>> getAllOccasions();
}
