import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/api_client/occasion_api_client.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';
import 'package:injectable/injectable.dart';

abstract class OccasionRemoteDataSource {
  Future<BaseResponse<List<OccasionModel>>> getAllOccasions();
  Future<BaseResponse<OccasionModel>> getOccasionById(String id);
}

@Injectable(as: OccasionRemoteDataSource)
class OccasionRemoteDataSourceImpl implements OccasionRemoteDataSource {
  final OccasionApiClient _apiClient;

  OccasionRemoteDataSourceImpl(this._apiClient);

  @override
  Future<BaseResponse<List<OccasionModel>>> getAllOccasions() async {
    try {
      final response = await _apiClient.getAllOccasions();

      final List<dynamic> data = response['occasions'] ?? [];
      final occasions = data
          .map((json) => OccasionModel.fromJson(json))
          .toList();
      return SuccessResponse(data: occasions);
    } catch (e) {
      return ErrorResponse(error: Exception(e.toString()));
    }
  }

  @override
  Future<BaseResponse<OccasionModel>> getOccasionById(String id) async {
    try {
      final response = await _apiClient.getOccasionById(id);

      final occasion = OccasionModel.fromJson(response['data']);
      return SuccessResponse(data: occasion);
    } catch (e) {
      return ErrorResponse(error: Exception(e.toString()));
    }
  }
}
