import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/home/presentation/view_model/app_tab.dart';
class HomeStates {
  final HomeBaseState homeBaseState;

  HomeStates({required this.homeBaseState});

  HomeStates copyWith({HomeBaseState? homeBaseState}) {
    return HomeStates(
        homeBaseState: HomeBaseState(
            currAppTab: homeBaseState?.currAppTab ??
                this.homeBaseState.currAppTab,
            isLoading: homeBaseState?.isLoading ?? this.homeBaseState.isLoading,
            success: homeBaseState?.success ?? this.homeBaseState.success,
            error: homeBaseState?.error ?? this.homeBaseState.error
        )
    );
  }
}

class HomeBaseState extends BaseState<String> {
  AppTab currAppTab;

  HomeBaseState({this.currAppTab = AppTab
      .home, super.isLoading, super.success, super.error});
}