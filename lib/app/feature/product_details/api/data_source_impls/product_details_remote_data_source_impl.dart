import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product_details/data/models/product_details_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/api_utils/api_utils.dart';
import '../../data/data_sources/product_details_remote_data_source_contract.dart';
import '../../data/models/products/products_response.dart';
import '../../domain/request/query_product_request.dart';
import '../api_client/api_client.dart';

@Injectable(as: ProductDetailsRemoteDataSourceContract)
class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSourceContract {
  ProductDetailsApiClient apiClient;

  ProductDetailsRemoteDataSourceImpl(this.apiClient);
  @override
  Future<BaseResponse<ProductDetailsDto>> getProductDetails(
      String productId) async =>
      executeApi(() => apiClient.getProductDetails(productId));

  @override
  Future<BaseResponse<ProductsResponse>> getQueryProducts(
      QueryProductRequest queryProductRequest) =>
      executeApi(() => apiClient.getQueryProducts(queryProductRequest));
}
