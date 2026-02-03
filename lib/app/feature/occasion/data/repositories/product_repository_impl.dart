import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/data_sources/product_remote_data_source.dart';
import 'package:flower_app/app/feature/occasion/data/models/product_model.dart';
import 'package:flower_app/app/feature/occasion/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;

  ProductRepositoryImpl(this._remoteDataSource);

  @override
  Future<BaseResponse<List<ProductModel>>> getProductsByOccasion(
    String occasionId,
  ) async {
    return await _remoteDataSource.getProductsByOccasion(occasionId);
  }
}
