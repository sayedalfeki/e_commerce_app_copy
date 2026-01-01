import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product_details/api/data_source_impls/product_details_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/product_details/data/models/product_details_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'product_details_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ProductDetailsRemoteDataSourceImpl])
void main() {
  late ProductDetailsRemoteDataSourceImpl productDetailsRemoteDataSourceImpl;
  setUpAll(() {
    productDetailsRemoteDataSourceImpl = MockProductDetailsRemoteDataSourceImpl();
    provideDummy<BaseResponse<ProductDetailsDto>>(
      SuccessResponse<ProductDetailsDto>(data: ProductDetailsDto())
    );
  },);

  group("Test Get Product Details function test cases", () {
    test("Test Success case with Product Details", ()async{

      when(productDetailsRemoteDataSourceImpl.getProductDetails("fdsd342412weqs")).thenAnswer((_) async{
        return await SuccessResponse<ProductDetailsDto>(data: ProductDetailsDto(message: "success",product: Product(id:"fdsd342412weqs")));
      },);
      var response = await productDetailsRemoteDataSourceImpl.getProductDetails("fdsd342412weqs");
      expect(response, isA<SuccessResponse<ProductDetailsDto>>());
      expect((response as SuccessResponse<ProductDetailsDto> ).data.message, isNotEmpty);
    });

    test("Test Error case with Product Details", ()async{
      when(productDetailsRemoteDataSourceImpl.getProductDetails("fdsd342412weqs")).thenAnswer((_) async{
        return await ErrorResponse<ProductDetailsDto>(error: Exception());
      },);
      var result = await productDetailsRemoteDataSourceImpl.getProductDetails("fdsd342412weqs");
      expect(result, isA<ErrorResponse<ProductDetailsDto>>());
      expect((result as ErrorResponse<ProductDetailsDto> ).error.toString(), isNotEmpty);
    });
  },);
}