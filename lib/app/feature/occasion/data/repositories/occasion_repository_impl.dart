import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/data_sources/occasion_remote_data_source.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';
import 'package:flower_app/app/feature/occasion/domain/repositories/occasion_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OccasionRepository)
class OccasionRepositoryImpl implements OccasionRepository {
  final OccasionRemoteDataSource _remoteDataSource;

  OccasionRepositoryImpl(this._remoteDataSource);

  @override
  Future<BaseResponse<List<OccasionModel>>> getAllOccasions() async {
    return await _remoteDataSource.getAllOccasions();
  }

  @override
  Future<BaseResponse<OccasionModel>> getOccasionById(String id) async {
    return await _remoteDataSource.getOccasionById(id);
  }
}
