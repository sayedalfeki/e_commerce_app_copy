import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product/data/models/product/product_response.dart';
import 'package:flower_app/app/feature/product/data/models/products/products_response.dart';
import 'package:flower_app/app/feature/product/domain/request/query_product_request.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/api_utils/api_utils.dart';
import '../../data/data_sources/product_remote_data_source_contract.dart';
import '../api_client/api_client.dart';

@Injectable(as: ProductRemoteDataSourceContract)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSourceContract {
  ProductApiClient apiClient;

  ProductRemoteDataSourceImpl(this.apiClient);
  @override
  Future<BaseResponse<ProductResponse>> getProductDetails(
      String productId) async =>
      executeApi(() => apiClient.getProductDetails(productId));

  @override
  Future<BaseResponse<ProductsResponse>> getQueryProducts(
      QueryProductRequest queryProductRequest) =>
      executeApi(() => apiClient.getQueryProducts(queryProductRequest));
}
