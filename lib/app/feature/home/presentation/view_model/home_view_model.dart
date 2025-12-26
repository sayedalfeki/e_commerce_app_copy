import 'package:flower_app/app/feature/home/presentation/view_model/app_tab.dart';
import 'package:flower_app/app/feature/home/presentation/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeViewModel extends Cubit<HomeStates>{
  HomeViewModel():super(HomeStates());
  void switchTab(AppTab tab){
    emit(state.copyWith(
      currAppTab: tab
    ));
  }
}
