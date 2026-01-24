import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';

abstract class OccasionRepository {
  Future<BaseResponse<List<OccasionModel>>> getAllOccasions();
  Future<BaseResponse<OccasionModel>> getOccasionById(String id);
}
