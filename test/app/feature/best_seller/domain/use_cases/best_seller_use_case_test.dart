import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/best_seller/data/repos/best_seller_repo_impl.dart';
import 'package:flower_app/app/feature/best_seller/domain/models/best_seller_model.dart';
import 'package:flower_app/app/feature/best_seller/domain/use_cases/best_seller_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'best_seller_use_case_test.mocks.dart';

@GenerateMocks([BestSellerRepoImpl])
void main() {
  late BestSellerUseCase bestSellerUseCase;
  late MockBestSellerRepoImpl mockBestSellerRepoImpl;
  setUpAll(() {
    provideDummy<BaseResponse<List<BestSellerModel>>>(SuccessResponse<List<BestSellerModel>>(data: []));
    mockBestSellerRepoImpl=MockBestSellerRepoImpl();
    bestSellerUseCase=BestSellerUseCase(mockBestSellerRepoImpl);
  },);
  group('bestSellerUseCase test cases',() {
    test('checking that call function works properly', () async{
      final dummyModels=[BestSellerModel(id: 'id1',title: 'title1'),BestSellerModel(id: 'id2',title: 'title2')];
      when(mockBestSellerRepoImpl.getBestSellers()).thenAnswer(
        (_) async=> SuccessResponse<List<BestSellerModel>>(data: dummyModels),
      );
      final result=await bestSellerUseCase.call();
      expect(result, isA<SuccessResponse<List<BestSellerModel>>>());
      expect((result as SuccessResponse<List<BestSellerModel>>).data.length, dummyModels.length);
      expect(result.data[0].id, equals(dummyModels[0].id));
      expect(result.data[0].title, equals(dummyModels[0].title));
      expect(result.data[1].id, equals(dummyModels[1].id));
      expect(result.data[1].title, equals(dummyModels[1].title));
      verify(mockBestSellerRepoImpl.getBestSellers()).called(1);
    },);
    test('checking the case returning with error response', () async{
      final dummyError=Exception("Network Exception");
      when(mockBestSellerRepoImpl.getBestSellers()).thenAnswer(
        (_) async=> ErrorResponse<List<BestSellerModel>>(error: dummyError),
      );
      final result=await bestSellerUseCase.call();
      expect(result, isA<ErrorResponse<List<BestSellerModel>>>());
      expect((result as ErrorResponse<List<BestSellerModel>>).error.toString(), equals(dummyError.toString()));
      verify(mockBestSellerRepoImpl.getBestSellers()).called(1);
    },);
  }, );
}