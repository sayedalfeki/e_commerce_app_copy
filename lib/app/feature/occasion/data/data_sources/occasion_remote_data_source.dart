import 'package:dio/dio.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/core/endpoint/app_endpoint.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';
import 'package:injectable/injectable.dart';

abstract class OccasionRemoteDataSource {
  Future<BaseResponse<List<OccasionModel>>> getAllOccasions();
  Future<BaseResponse<OccasionModel>> getOccasionById(String id);
}

@Injectable(as: OccasionRemoteDataSource)
class OccasionRemoteDataSourceImpl implements OccasionRemoteDataSource {
  final Dio _dio;

  OccasionRemoteDataSourceImpl(this._dio);

  @override
  Future<BaseResponse<List<OccasionModel>>> getAllOccasions() async {
    try {
      final response = await _dio.get(AppEndPoint.occasions);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['occasions'] ?? [];
        final occasions = data
            .map((json) => OccasionModel.fromJson(json))
            .toList();
        return SuccessResponse(data: occasions);
      } else {
        return ErrorResponse(error: Exception('Failed to load occasions'));
      }
    } catch (e) {
      return ErrorResponse(error: Exception(e.toString()));
    }
  }

  @override
  Future<BaseResponse<OccasionModel>> getOccasionById(String id) async {
    try {
      final response = await _dio.get(AppEndPoint.occasionById(id));

      if (response.statusCode == 200) {
        final occasion = OccasionModel.fromJson(response.data['data']);
        return SuccessResponse(data: occasion);
      } else {
        return ErrorResponse(error: Exception('Failed to load occasion'));
      }
    } catch (e) {
      return ErrorResponse(error: Exception(e.toString()));
    }
  }
}
