import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasions/domain/model/products_occasion_entity.dart';
import 'package:injectable/injectable.dart';
import '../repository/occasions_repo_contract.dart';

@injectable
class GetProductsOccasionUseCase {
  final OccasionsRepoContract _occasionsRepo;

  GetProductsOccasionUseCase(this._occasionsRepo);

  Future<BaseResponse<ProductsOccasionEntity>> invoke(String occasionId) {
    return _occasionsRepo.getProductsByOccasion(occasionId);
  }
}
