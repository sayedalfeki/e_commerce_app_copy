
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/best_seller/api/api_client/best_seller_api_client.dart';
import 'package:flower_app/app/feature/best_seller/api/datasources/remote/best_seller_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/best_seller/data/models/best_seller_dto.dart';
import 'package:flower_app/app/feature/best_seller/data/models/best_seller_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'best_seller_remote_data_source_impl_test.mocks.dart';
@GenerateMocks([BestSellerApiClient])
void main() {
  late BestSellerRemoteDataSourceImpl bestSellerRemoteDataSourceImpl;
  late MockBestSellerApiClient mockBestSellerApiClient;
  setUpAll(() {
    mockBestSellerApiClient=MockBestSellerApiClient();
    bestSellerRemoteDataSourceImpl=BestSellerRemoteDataSourceImpl(mockBestSellerApiClient);
  },);
  test('testing functionality of getBestSellers function',() async{
    final dummyRes=BestSellerResponse(
      message: "Success",
      bestSeller: [BestSellerDTO(id: "id1",title: "title1"),BestSellerDTO(id: "id2",title: "title2")]
    );
    when(mockBestSellerApiClient.getBestSellers()).thenAnswer(
      (_) async=>dummyRes ,
    );
    final result=await bestSellerRemoteDataSourceImpl.getBestSellers();
    expect(result, isA<BaseResponse<BestSellerResponse>>());
    expect((result as SuccessResponse<BestSellerResponse>).data.bestSeller?.length, equals(dummyRes.bestSeller?.length));
    expect(result.data.message, equals(dummyRes.message));
    expect(result.data.bestSeller?[0].id, equals(dummyRes.bestSeller?[0].id));
    expect(result.data.bestSeller?[0].title, equals(dummyRes.bestSeller?[0].title));
    expect(result.data.bestSeller?[1].id, equals(dummyRes.bestSeller?[1].id));
    expect(result.data.bestSeller?[1].title, equals(dummyRes.bestSeller?[1].title));
    verify(mockBestSellerApiClient.getBestSellers()).called(1);
  });
}