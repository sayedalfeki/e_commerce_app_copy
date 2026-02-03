import 'package:dio/dio.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/core/endpoint/app_endpoint.dart';
import 'package:flower_app/app/feature/occasion/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

abstract class ProductRemoteDataSource {
  Future<BaseResponse<List<ProductModel>>> getProductsByOccasion(
    String occasionId,
  );
}

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSourceImpl(this._dio);

  @override
  Future<BaseResponse<List<ProductModel>>> getProductsByOccasion(
    String occasionId,
  ) async {
    try {
      final response = await _dio.get(
        AppEndPoint.productsByOccasion(occasionId),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['products'] ?? [];
        final products = data
            .map((json) => ProductModel.fromJson(json))
            .toList();
        return SuccessResponse(data: products);
      } else {
        return ErrorResponse(error: Exception('Failed to load products'));
      }
    } catch (e) {
      return ErrorResponse(error: Exception(e.toString()));
    }
  }
}
