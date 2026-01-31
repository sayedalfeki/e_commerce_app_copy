import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/datasources/remote/home_tab_remote_data_source_contract.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/get_home_tab_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/get_home_tab_response_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/repos/home_tab_repo_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeTabRepoContract)
class HomeTabRepoImpl implements HomeTabRepoContract{
  final HomeTabRemoteDataSourceContract homeTabRemoteDataSourceContract;
  HomeTabRepoImpl(this.homeTabRemoteDataSourceContract);
  @override
  Future<BaseResponse<GetHomeTabResponseModel>> getHomeTabDetails() async{
    var response=await homeTabRemoteDataSourceContract.getHomeTabDetails();
    switch(response){
      
      case SuccessResponse<GetHomeTabResponse>():
        GetHomeTabResponseModel model=response.data.toDomain();
        return SuccessResponse<GetHomeTabResponseModel>(data:model);
      case ErrorResponse<GetHomeTabResponse>():
        return ErrorResponse<GetHomeTabResponseModel>(error: response.error);
    }
  }

}