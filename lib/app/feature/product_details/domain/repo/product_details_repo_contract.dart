import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product_details/domain/models/product_details_model.dart';

import '../models/products_entity.dart';
import '../request/query_product_request.dart';

abstract class ProductDetailsRepoContract {
  Future<BaseResponse<ProductDetailsModel>> getProductDetails(String productId);

  Future<BaseResponse<ProductsEntity>> getQueryProducts(
    QueryProductRequest queryProductRequest,
  );
}
