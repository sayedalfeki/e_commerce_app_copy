import 'package:flower_app/app/config/api_utils/api_utils.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/core/model/products/products_respons.dart';
import 'package:flower_app/app/feature/occasions/api/occasions_api_client/occasions_api_clients.dart';
import 'package:flower_app/app/feature/occasions/data/data_source/occasions_remote_data_source.dart';
import 'package:flower_app/app/feature/occasions/data/model/all_occasions_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OccasionsRemoteDataSourceContract)
class OccasionsRemoteDataSourceImpl extends OccasionsRemoteDataSourceContract {
  final OccasionsApiClient _occasionsApiClient;

  OccasionsRemoteDataSourceImpl({
    required OccasionsApiClient occasionsApiClient,
  }) : _occasionsApiClient = occasionsApiClient;

  @override
  Future<BaseResponse<AllOccasionResponse>> getAllOccasions() {
    return executeApi(() => _occasionsApiClient.getAllOccasions());
  }

  @override
  Future<BaseResponse<ProductsResponse>> getProductsByOccasion(
      String occasionId) {
    return executeApi(() =>
        _occasionsApiClient.getAllProductsByOccasion(occasionId));
  }
}
