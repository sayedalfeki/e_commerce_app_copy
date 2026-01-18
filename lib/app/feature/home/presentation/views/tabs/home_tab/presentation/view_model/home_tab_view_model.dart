import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/get_home_tab_response_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/use_cases/home_tab_use_case.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/presentation/view_model/home_tab_events.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/presentation/view_model/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  final HomeTabUseCase _homeTabUseCase;
  HomeTabViewModel(this._homeTabUseCase):super(HomeTabStates());
  void doIntent(HomeTabEvents event){
    switch(event){
      
      case GetHomeTabDetailsEvent():
        _getHomeTabDetails();
    }
  }
  Future<void> _getHomeTabDetails() async{
    emit(state.copyWith(
      getHomeTabDetailsState: BaseState<GetHomeTabResponseModel>(
        isLoading: true
      )
    ));
    final res=await _homeTabUseCase.call();
    switch (res){
      
      case SuccessResponse<GetHomeTabResponseModel>():
        emit(state.copyWith(
          getHomeTabDetailsState: BaseState<GetHomeTabResponseModel>(
            isLoading: false,
            success: res.data
          )
        ));
      case ErrorResponse<GetHomeTabResponseModel>():
        emit(state.copyWith(
          getHomeTabDetailsState: BaseState<GetHomeTabResponseModel>(
            isLoading: false,
            error: res.error
          )
        ));
    }
  }
}