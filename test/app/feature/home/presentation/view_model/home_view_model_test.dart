import 'package:flower_app/app/feature/home/presentation/view_model/home_view_model.dart';
import 'package:test/test.dart';

void main() {
  late HomeViewModel homeViewModel;
  setUpAll(() {
    homeViewModel=HomeViewModel();
  },);
  group('test cases of home view model',() {
    test('checking that initial state has a current index of zero value (at first tab(home tab))',(){
      expect(homeViewModel.state.currIndex, isZero);
    });
    test('checking that switchTab updates current index', () {
      homeViewModel.switchTab(1);
      expect(homeViewModel.state.currIndex, equals(1));
    },);
    test('checking switching between multiple tabs', () {
      homeViewModel.switchTab(2);
      expect(homeViewModel.state.currIndex, equals(2));
      homeViewModel.switchTab(3);
      expect(homeViewModel.state.currIndex, equals(3));
    },);
    test('checking that pressing the same tab twice is handled properly', () {
      homeViewModel.switchTab(2);
      homeViewModel.switchTab(2);
      expect(homeViewModel.state.currIndex, equals(2));
    },);
  },);
  
}