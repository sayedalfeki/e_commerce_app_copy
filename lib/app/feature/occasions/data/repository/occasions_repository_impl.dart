import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasions/data/data_source/occasions_remote_data_source.dart';
import 'package:flower_app/app/feature/occasions/data/model/all_occasions_response.dart';
import 'package:flower_app/app/feature/occasions/domain/model/all_occasions_entity.dart';
import 'package:flower_app/app/feature/occasions/domain/model/products_occasion_entity.dart';
import 'package:flower_app/app/feature/occasions/domain/repository/occasions_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/model/products/products_respons.dart';

@Injectable(as: OccasionsRepoContract)
class OccasionsRepositoryImpl extends OccasionsRepoContract {
  final OccasionsRemoteDataSourceContract _occasionsRemoteDataSource;

  OccasionsRepositoryImpl({
    required OccasionsRemoteDataSourceContract occasionsRemoteDataSource,
  }) : _occasionsRemoteDataSource = occasionsRemoteDataSource;

  @override
  Future<BaseResponse<AllOccasionsEntity>> getAllOccasions() async {
    final response = await _occasionsRemoteDataSource.getAllOccasions();
    switch (response) {
      case SuccessResponse<AllOccasionResponse>():
        return SuccessResponse(data: response.data.toAllOccasionsEntity());
      case ErrorResponse<AllOccasionResponse>():
        return ErrorResponse<AllOccasionsEntity>(error: response.error);
    }
  }

  @override
  Future<BaseResponse<ProductsOccasionEntity>> getProductsByOccasion(
      String occasionId) async {
    final response = await _occasionsRemoteDataSource.getProductsByOccasion(
        occasionId);
    switch (response) {
      case SuccessResponse<ProductsResponse>():
        ProductsOccasionEntity productsOccasionEntity = response.data
            .toProductsOccasionEntity();
        return SuccessResponse(data: productsOccasionEntity);
      case ErrorResponse<ProductsResponse>():
        return ErrorResponse<ProductsOccasionEntity>(error: response.error);
    }
  }
}
