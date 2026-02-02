import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/best_seller/api/datasources/remote/best_seller_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/best_seller/data/models/best_seller_dto.dart';
import 'package:flower_app/app/feature/best_seller/data/models/best_seller_response.dart';
import 'package:flower_app/app/feature/best_seller/data/repos/best_seller_repo_impl.dart';
import 'package:flower_app/app/feature/best_seller/domain/models/best_seller_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'best_seller_repo_impl_test.mocks.dart';
@GenerateMocks([BestSellerRemoteDataSourceImpl])
void main() {
  late BestSellerRepoImpl bestSellerRepoImpl;
  late MockBestSellerRemoteDataSourceImpl mockBestSellerRemoteDataSourceImpl;
  setUpAll(() {
    provideDummy<BaseResponse<BestSellerResponse>>(
      SuccessResponse<BestSellerResponse>(data: BestSellerResponse(
        bestSeller: [],
        message: "Success"
      ))
    );
    mockBestSellerRemoteDataSourceImpl=MockBestSellerRemoteDataSourceImpl();
    bestSellerRepoImpl=BestSellerRepoImpl(mockBestSellerRemoteDataSourceImpl);
  },);
  group('getBestSellers test cases',(){
    test('success case with list of dtos', () async{
      List<BestSellerDTO> dummyDtos=[
        BestSellerDTO(id: "id1",title: "title1",imgCover: "imgCover1",price: 200),
        BestSellerDTO(id: "id2",title: "title2",imgCover: "imgCover2",price: 300),
      ];
      when(mockBestSellerRemoteDataSourceImpl.getBestSellers()).thenAnswer(
        (_) async=>SuccessResponse<BestSellerResponse>(data: BestSellerResponse(bestSeller: dummyDtos)) ,
      );
      final result=await bestSellerRepoImpl.getBestSellers();
      expect(result, isA<BaseResponse<List<BestSellerModel>>>());
      expect((result as SuccessResponse<List<BestSellerModel>>).data.length, equals(dummyDtos.length));
      expect(result.data[0].id, equals(dummyDtos[0].id));
      expect(result.data[0].title, equals(dummyDtos[0].title));
      expect(result.data[0].imgCover, equals(dummyDtos[0].imgCover));
      expect(result.data[0].price, equals(dummyDtos[0].price));
      expect(result.data[1].id, equals(dummyDtos[1].id));
      expect(result.data[1].title, equals(dummyDtos[1].title));
      expect(result.data[1].imgCover, equals(dummyDtos[1].imgCover));
      expect(result.data[1].price, equals(dummyDtos[1].price));
      verify(mockBestSellerRemoteDataSourceImpl.getBestSellers()).called(1);
    },);
    test('failure case with an exception', () async{
      Exception dummyError=Exception("Network Error");
      when(mockBestSellerRemoteDataSourceImpl.getBestSellers()).thenAnswer(
        (_) async=> ErrorResponse<BestSellerResponse>(error: dummyError),
      );
      final result=await bestSellerRepoImpl.getBestSellers();
      expect(result, isA<ErrorResponse<List<BestSellerModel>>>());
      expect((result as ErrorResponse<List<BestSellerModel>>).error.toString(), equals(dummyError.toString()));
      verify(mockBestSellerRemoteDataSourceImpl.getBestSellers()).called(1);
    },);
  });
}