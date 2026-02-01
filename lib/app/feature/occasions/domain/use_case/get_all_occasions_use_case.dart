import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasions/domain/model/all_occasions_entity.dart';
import 'package:flower_app/app/feature/occasions/domain/repository/occasions_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllOccasionsUseCase {
  final OccasionsRepoContract _occasionsRepoContract;

  GetAllOccasionsUseCase({required OccasionsRepoContract occasionsRepoContract})
    : _occasionsRepoContract = occasionsRepoContract;

  Future<BaseResponse<OccasionsEntity>> invoke() {
    return _occasionsRepoContract.getAllOccasions();
  }
}
