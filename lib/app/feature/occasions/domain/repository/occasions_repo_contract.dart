import 'package:flower_app/app/feature/occasions/domain/model/products_occasion_entity.dart';

import '../../../../config/base_response/base_response.dart';
import '../model/all_occasions_entity.dart';

abstract class OccasionsRepoContract {
  Future<BaseResponse<AllOccasionsEntity>> getAllOccasions();

  Future<BaseResponse<ProductsOccasionEntity>> getProductsByOccasion(
      String occasionId);
}
