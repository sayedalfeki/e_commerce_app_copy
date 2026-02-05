import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/api_client/product_api_client.dart';
import 'package:flower_app/app/feature/occasion/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

abstract class ProductRemoteDataSource {
  Future<BaseResponse<List<ProductModel>>> getProductsByOccasion(
    String occasionId,
  );
}

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ProductApiClient _apiClient;

  ProductRemoteDataSourceImpl(this._apiClient);

  @override
  Future<BaseResponse<List<ProductModel>>> getProductsByOccasion(
    String occasionId,
  ) async {
    try {
      final response = await _apiClient.getProductsByOccasion(occasionId);

      final List<dynamic> data = response['products'] ?? [];
      final products = data.map((json) => ProductModel.fromJson(json)).toList();
      return SuccessResponse(data: products);
    } catch (e) {
      return ErrorResponse(error: Exception(e.toString()));
    }
  }
}
