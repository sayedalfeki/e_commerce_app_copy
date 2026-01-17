import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/get_home_tab_response_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/repos/home_tab_repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeTabUseCase {
  final HomeTabRepoContract homeTabRepoContract;
  HomeTabUseCase(this.homeTabRepoContract);
  Future<BaseResponse<GetHomeTabResponseModel>> call() async{
    return homeTabRepoContract.getHomeTabDetails();
  }
}