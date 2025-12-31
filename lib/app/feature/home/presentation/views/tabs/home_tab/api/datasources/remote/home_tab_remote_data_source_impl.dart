import 'package:flower_app/app/config/api_utils/api_utils.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/api/api_client/home_tab_api_client.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/datasources/remote/home_tab_remote_data_source_contract.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/get_home_tab_response.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeTabRemoteDataSourceContract)
class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSourceContract{
  final HomeTabApiClient homeTabApiClient;
  HomeTabRemoteDataSourceImpl(this.homeTabApiClient);
  @override
  Future<BaseResponse<GetHomeTabResponse>> getHomeTabDetails() {
    return executeApi(() => homeTabApiClient.getHomeTabDetails(),);
  }
}