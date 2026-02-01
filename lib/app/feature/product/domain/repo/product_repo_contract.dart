import 'package:flower_app/app/config/base_response/base_response.dart';

import '../models/products_entity.dart';
import '../request/query_product_request.dart';

abstract class ProductRepoContract {
  Future<BaseResponse<ProductEntity>> getProductDetails(String productId);

  Future<BaseResponse<ProductsEntity>> getQueryProducts(
    QueryProductRequest queryProductRequest,
  );
}
