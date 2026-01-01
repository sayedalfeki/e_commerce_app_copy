import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';
import 'package:flower_app/app/feature/occasion/domain/repositories/occasion_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOccasionByIdUseCase {
  final OccasionRepository _repository;

  GetOccasionByIdUseCase(this._repository);

  Future<BaseResponse<OccasionModel>> call(String id) async {
    return await _repository.getOccasionById(id);
  }
}
