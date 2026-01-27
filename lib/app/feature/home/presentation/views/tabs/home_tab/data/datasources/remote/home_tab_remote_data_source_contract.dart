import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/get_home_tab_response.dart';

abstract class HomeTabRemoteDataSourceContract {
  Future<BaseResponse<GetHomeTabResponse>> getHomeTabDetails();
}