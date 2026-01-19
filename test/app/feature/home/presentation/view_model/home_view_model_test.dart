import 'package:flower_app/app/feature/home/presentation/view_model/app_tab.dart';
import 'package:flower_app/app/feature/home/presentation/view_model/home_view_model.dart';
import 'package:test/test.dart';

void main() {
  late HomeViewModel homeViewModel;
  setUpAll(() {
    homeViewModel=HomeViewModel();
  },);
  group('test cases of home view model',() {
    test('checking that initial state is home tab)',(){
      expect(homeViewModel.state.currAppTab, AppTab.home);
      expect(homeViewModel.state.currAppTab.index, isZero);
    });
    test('checking switching to any tab', () {
      homeViewModel.switchTab(AppTab.cart);
      expect(homeViewModel.state.currAppTab, AppTab.cart);
      expect(homeViewModel.state.currAppTab.index, equals(2));
    },);
    test('checking switching between multiple tabs', () {
      homeViewModel.switchTab(AppTab.categories);
      expect(homeViewModel.state.currAppTab, AppTab.categories);
      expect(homeViewModel.state.currAppTab.index, equals(1));
      homeViewModel.switchTab(AppTab.profile);
      expect(homeViewModel.state.currAppTab, AppTab.profile);
      expect(homeViewModel.state.currAppTab.index, equals(3));
    },);
    test('checking that pressing the same tab twice is handled properly', () {
      homeViewModel.switchTab(AppTab.categories);
      homeViewModel.switchTab(AppTab.categories);
      expect(homeViewModel.state.currAppTab, AppTab.categories);
      expect(homeViewModel.state.currAppTab.index, equals(1));
    },);
  },);
  
}