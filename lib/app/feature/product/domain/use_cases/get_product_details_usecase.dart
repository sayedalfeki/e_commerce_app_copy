import 'package:flower_app/app/config/base_response/base_response.dart';

import 'package:injectable/injectable.dart';
import '../models/products_entity.dart';
import '../repo/product_repo_contract.dart';

@injectable
class GetProductDetailsUseCase {
  ProductRepoContract productDetailsRepoContract;

  GetProductDetailsUseCase(this.productDetailsRepoContract);

  Future<BaseResponse<ProductEntity>> call(String productId) {
    var response = productDetailsRepoContract.getProductDetails(productId);
    return response;
  }
}