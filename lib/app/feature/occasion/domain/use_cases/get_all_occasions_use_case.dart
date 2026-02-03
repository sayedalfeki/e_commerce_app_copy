import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';
import 'package:flower_app/app/feature/occasion/domain/repositories/occasion_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllOccasionsUseCase {
  final OccasionRepository _repository;

  GetAllOccasionsUseCase(this._repository);

  Future<BaseResponse<List<OccasionModel>>> call() async {
    return await _repository.getAllOccasions();
  }
}
