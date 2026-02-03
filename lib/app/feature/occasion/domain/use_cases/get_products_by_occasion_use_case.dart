import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/models/product_model.dart';
import 'package:flower_app/app/feature/occasion/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsByOccasionUseCase {
  final ProductRepository _repository;

  GetProductsByOccasionUseCase(this._repository);

  Future<BaseResponse<List<ProductModel>>> call(String occasionId) async {
    return await _repository.getProductsByOccasion(occasionId);
  }
}
