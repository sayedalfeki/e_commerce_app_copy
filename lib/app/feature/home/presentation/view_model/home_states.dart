import 'package:flower_app/app/feature/home/presentation/view_model/app_tab.dart';

class HomeStates {
  AppTab currAppTab;
  HomeStates({this.currAppTab=AppTab.home});
  HomeStates copyWith({AppTab? currAppTab}){
    return HomeStates(
      currAppTab: currAppTab?? this.currAppTab
    );
  }
}