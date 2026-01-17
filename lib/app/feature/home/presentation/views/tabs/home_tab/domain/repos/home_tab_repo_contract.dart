import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/get_home_tab_response_model.dart';

abstract class HomeTabRepoContract {
  Future<BaseResponse<GetHomeTabResponseModel>> getHomeTabDetails();
}