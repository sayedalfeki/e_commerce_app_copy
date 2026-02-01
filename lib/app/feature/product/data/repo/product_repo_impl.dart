import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product/data/models/products/products_response.dart';

import 'package:flower_app/app/feature/product/domain/request/query_product_request.dart';

import 'package:injectable/injectable.dart';
import '../../domain/models/products_entity.dart';
import '../../domain/repo/product_repo_contract.dart';
import '../data_sources/product_remote_data_source_contract.dart';
import '../models/product/product_response.dart';

@Injectable(as: ProductRepoContract)
class ProductRepoImpl implements ProductRepoContract {
  ProductRemoteDataSourceContract productRemoteDataSourceContract;

  ProductRepoImpl(this.productRemoteDataSourceContract);

  @override
  Future<BaseResponse<ProductEntity>> getProductDetails(
      String productId) async {
    var response = await productRemoteDataSourceContract.getProductDetails(
        productId);
    switch (response) {
      case SuccessResponse<ProductResponse>():
        ProductEntity productDetailsModel = response.data.product!.toModel();
        return SuccessResponse<ProductEntity>(data: productDetailsModel);
      case ErrorResponse<ProductResponse>():
        return ErrorResponse<ProductEntity>(error: response.error);
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