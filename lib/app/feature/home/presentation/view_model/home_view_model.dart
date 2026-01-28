import 'package:flower_app/app/feature/home/presentation/view_model/app_tab.dart';
import 'package:flower_app/app/feature/home/presentation/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/local_storage_processes/domain/use_case/get_token_use_case.dart';
import 'home_intent.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates>{
  HomeViewModel(this._getTokenUseCase)
    : super(HomeStates(homeBaseState: HomeBaseState()));
  final GetTokenUseCase _getTokenUseCase;

  Future<void> _getUserToken() async {
    final token = await _getTokenUseCase.invoke();
    emit(state.copyWith(homeBaseState: HomeBaseState(success: token)));
  }

  void _switchTab(AppTab tab) {
    emit(state.copyWith(homeBaseState: HomeBaseState(currAppTab: tab)));
  }

  void doIntent(HomeIntent intent) {
    switch (intent) {
      case GetTokenAction():
        _getUserToken();
        break;
      case ChangeCurrentTabAction():
        _switchTab(intent.tab);
        break;
    }
  }
}
