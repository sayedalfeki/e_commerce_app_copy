import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product_details/data/repo/product_repo_impl.dart';
import 'package:flower_app/app/feature/product_details/domain/models/product_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_details_repo_impl_test.mocks.dart';

@GenerateMocks([ProductDetailsRepoImpl])

void main() {
  late ProductDetailsRepoImpl productDetailsRepoImpl;
  setUpAll(() {
    productDetailsRepoImpl = MockProductDetailsRepoImpl();
    provideDummy<BaseResponse<ProductDetailsModel>>(
      SuccessResponse<ProductDetailsModel>(data: ProductDetailsModel())
    );
  },);

  group("Test Get Product Details function test cases", () {
    test("Test Success case with Product Details", ()async{

      when(productDetailsRepoImpl.getProductDetails("fdsd342412weqs")).thenAnswer((_) async{
        return SuccessResponse<ProductDetailsModel>(data: ProductDetailsModel(id:"fdsd342412weqs"));
      },);
      var response = await productDetailsRepoImpl.getProductDetails("fdsd342412weqs");
      expect(response, isA<SuccessResponse<ProductDetailsModel>>());
      expect((response as SuccessResponse<ProductDetailsModel> ).data.id, isNotEmpty);
    });

    test("Test Error case with Product Details", ()async{
      when(productDetailsRepoImpl.getProductDetails("fdsd342412weqs")).thenAnswer((_) async{
        return ErrorResponse<ProductDetailsModel>(error: Exception());
      },);
      var result = await productDetailsRepoImpl.getProductDetails("fdsd342412weqs");
      expect(result, isA<ErrorResponse<ProductDetailsModel>>());
      expect((result as ErrorResponse<ProductDetailsModel> ).error.toString(), isNotEmpty);
    });
  },);
}