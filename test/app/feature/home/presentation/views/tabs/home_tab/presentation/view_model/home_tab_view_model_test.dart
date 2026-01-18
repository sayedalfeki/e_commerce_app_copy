import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/best_seller_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/category_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/get_home_tab_response_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/occasion_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/use_cases/home_tab_use_case.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/presentation/view_model/home_tab_events.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/presentation/view_model/home_tab_states.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/presentation/view_model/home_tab_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'home_tab_view_model_test.mocks.dart';
@GenerateMocks([HomeTabUseCase])
void main() {
  late HomeTabViewModel homeTabViewModel;
  late MockHomeTabUseCase mockHomeTabUseCase;
  setUpAll(() {
    provideDummy<BaseResponse<GetHomeTabResponseModel>>(SuccessResponse<GetHomeTabResponseModel>(data: GetHomeTabResponseModel()));
    mockHomeTabUseCase=MockHomeTabUseCase();
    homeTabViewModel=HomeTabViewModel(mockHomeTabUseCase);
  },);
  tearDownAll(() {
    homeTabViewModel.close();
  },);
  group('GetHomeTabDetailsEvent cases', () {
    test('emitting loading then success when use case returns success', () {
      GetHomeTabResponseModel dummyModel=GetHomeTabResponseModel(
        categories: [CategoryModel(id: 'id',name: 'name')],
        bestSellers: [BestSellerModel(id: 'id',title: 'title')],
        occasions: [OccasionModel(id: 'id',name: 'name')]
      );
      when(mockHomeTabUseCase.call()).thenAnswer(
        (_) async=> SuccessResponse<GetHomeTabResponseModel>(data: dummyModel),
      );
      expectLater(
        homeTabViewModel.stream, 
        emitsInOrder([
          predicate<HomeTabStates>((state) => state.getHomeTabDetailsState?.isLoading==true,),
          predicate<HomeTabStates>((state) => state.getHomeTabDetailsState?.isLoading==false && state.getHomeTabDetailsState?.success==dummyModel,)
        ])
      );
      homeTabViewModel.doIntent(GetHomeTabDetailsEvent());
    },);
    test('emitting loading then error when use case returns error', () {
      Exception dummyError=Exception("Network Error");
      when(mockHomeTabUseCase.call()).thenAnswer(
        (_)async=>ErrorResponse<GetHomeTabResponseModel>(error: dummyError) ,
      );
      expectLater(
        homeTabViewModel.stream, 
        emitsInOrder([
          predicate<HomeTabStates>((state) => state.getHomeTabDetailsState?.isLoading==true,),
          predicate<HomeTabStates>((state) =>state.getHomeTabDetailsState?.isLoading==false && state.getHomeTabDetailsState?.error==dummyError ,)
        ])
      );
      homeTabViewModel.doIntent(GetHomeTabDetailsEvent());
    },);
  },);
}