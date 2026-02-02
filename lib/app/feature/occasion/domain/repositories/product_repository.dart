import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/models/product_model.dart';

abstract class ProductRepository {
  Future<BaseResponse<List<ProductModel>>> getProductsByOccasion(
    String occasionId,
  );
}
