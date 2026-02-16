import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product_details/domain/models/product_details_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/products_entity.dart';
import '../../domain/repo/product_details_repo_contract.dart';
import '../../domain/request/query_product_request.dart';
import '../data_sources/product_details_remote_data_source_contract.dart';
import '../models/product_details_dto.dart';
import '../models/products/products_response.dart';

@Injectable(as: ProductDetailsRepoContract)
class ProductDetailsRepoImpl implements ProductDetailsRepoContract {
  ProductDetailsRemoteDataSourceContract productRemoteDataSourceContract;

  ProductDetailsRepoImpl(this.productRemoteDataSourceContract);

  @override
  Future<BaseResponse<ProductDetailsModel>> getProductDetails(
      String productId) async {
    var response = await productRemoteDataSourceContract.getProductDetails(
        productId);
    switch (response) {
      case SuccessResponse<ProductDetailsDto>():
        ProductDetailsModel productDetailsModel = response.data.toModel();
        return SuccessResponse<ProductDetailsModel>(data: productDetailsModel);
      case ErrorResponse<ProductDetailsDto>():
        return ErrorResponse<ProductDetailsModel>(error: response.error);
    }
  }

  @override
  getQueryProducts(QueryProductRequest queryProductRequest) async {
    final response = await productRemoteDataSourceContract.getQueryProducts(
        queryProductRequest);
    switch (response) {
      case SuccessResponse<ProductsResponse>():
        ProductsEntity productsEntity = response.data.toProductsEntity();
        return SuccessResponse(data: productsEntity);
      case ErrorResponse<ProductsResponse>():
        return ErrorResponse<ProductsEntity>(error: response.error);
    }
  }
}