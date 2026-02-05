import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/best_seller/domain/models/best_seller_model.dart';
import 'package:flower_app/app/feature/best_seller/domain/use_cases/best_seller_use_case.dart';
import 'package:flower_app/app/feature/best_seller/presentation/view_model/best_seller_events.dart';
import 'package:flower_app/app/feature/best_seller/presentation/view_model/best_seller_states.dart';
import 'package:flower_app/app/feature/best_seller/presentation/view_model/best_seller_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'best_seller_view_model_test.mocks.dart';

@GenerateMocks([BestSellerUseCase])
void main() {
  late BestSellerViewModel bestSellerViewModel;
  late MockBestSellerUseCase mockBestSellerUseCase;
  setUpAll(() {
    provideDummy<BaseResponse<List<BestSellerModel>>>(SuccessResponse<List<BestSellerModel>>(data: []));
    mockBestSellerUseCase=MockBestSellerUseCase();
    bestSellerViewModel=BestSellerViewModel(mockBestSellerUseCase);
  },);
  tearDownAll(() {
    bestSellerViewModel.close();
  },);
  group('BestSellerViewModel test cases', () {
    test('success case with success response', () {
      final dummyModels=[BestSellerModel(id: 'id1',title: 'title1'),BestSellerModel(id: 'id2',title: 'title2')];
      when(mockBestSellerUseCase.call()).thenAnswer(
        (_)async =>SuccessResponse<List<BestSellerModel>>(data: dummyModels) ,
      );
      expectLater(
        bestSellerViewModel.stream, 
        emitsInOrder([
          predicate<BestSellerStates>((state) =>state.getBestSellersState?.isLoading==true,),
          predicate<BestSellerStates>((state) =>state.getBestSellersState?.isLoading==false && state.getBestSellersState?.success==dummyModels,)
        ])
      );
      bestSellerViewModel.doIntent(GetBestSellersEvent());
      verify(mockBestSellerUseCase.call()).called(1);
    },);
    test('failure case with error response', () {
      final dummyError=Exception("Network Error");
      when(mockBestSellerUseCase.call()).thenAnswer(
        (_)async =>ErrorResponse<List<BestSellerModel>>(error: dummyError) ,
      );
      expectLater(
        bestSellerViewModel.stream, 
        emitsInOrder([
          predicate<BestSellerStates>((state) =>state.getBestSellersState?.isLoading==true ,),
          predicate<BestSellerStates>((state) =>state.getBestSellersState?.isLoading==false && state.getBestSellersState?.error==dummyError ,)
        ])
      );
      bestSellerViewModel.doIntent(GetBestSellersEvent());
      verify(mockBestSellerUseCase.call()).called(1);
    },);
  },);
}