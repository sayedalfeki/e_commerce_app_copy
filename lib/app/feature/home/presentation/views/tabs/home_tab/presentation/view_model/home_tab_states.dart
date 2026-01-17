import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/get_home_tab_response_model.dart';

class HomeTabStates {
    BaseState<GetHomeTabResponseModel>? getHomeTabDetailsState;
    HomeTabStates({this.getHomeTabDetailsState});
    HomeTabStates copyWith({BaseState<GetHomeTabResponseModel>? getHomeTabDetailsState}){
        return HomeTabStates(
            getHomeTabDetailsState: getHomeTabDetailsState ?? this.getHomeTabDetailsState
        );
    }
}