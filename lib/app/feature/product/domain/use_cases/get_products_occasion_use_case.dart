import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:injectable/injectable.dart';
import '../models/products_entity.dart';
import '../repo/product_repo_contract.dart';
import '../request/query_product_request.dart';
@injectable
class GetProductsOccasionUseCase {
  final ProductRepoContract _productRepo;

  GetProductsOccasionUseCase(this._productRepo);

  Future<BaseResponse<ProductsEntity>> invoke(
      QueryProductRequest queryProductRequest) {
    return _productRepo.getQueryProducts(queryProductRequest);
  }
}
