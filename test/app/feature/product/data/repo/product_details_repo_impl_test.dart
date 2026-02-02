import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product/api/data_source_impls/product_details_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/product/data/data_sources/product_remote_data_source_contract.dart';
import 'package:flower_app/app/feature/product/data/repo/product_repo_impl.dart';
import 'package:flower_app/app/feature/product/domain/models/product_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_details_repo_impl_test.mocks.dart';

@GenerateMocks([ProductRemoteDataSourceContract])

void main() {
  late ProductRemoteDataSourceImpl productRemoteDataSource;
  late ProductRepoImpl productRepo;
  setUpAll(() {
    productRepo = MockProductRepoImpl();
    provideDummy<BaseResponse<ProductDetailsModel>>(
      SuccessResponse<ProductDetailsModel>(data: ProductDetailsModel())
    );
  },);

  group("Test Get Product Details function test cases", () {
    test("Test Success case with Product Details", ()async{
      when(productRepo.getProductDetails("fdsd342412weqs")).thenAnswer((
          _) async {
        return SuccessResponse<ProductDetailsModel>(data: ProductDetailsModel(id:"fdsd342412weqs"));
      },);
      var response = await productRepo.getProductDetails("fdsd342412weqs");
      expect(response, isA<SuccessResponse<ProductDetailsModel>>());
      expect((response as SuccessResponse<ProductDetailsModel> ).data.id, isNotEmpty);
    });

    test("Test Error case with Product Details", ()async{
      when(productRepo.getProductDetails("fdsd342412weqs")).thenAnswer((
          _) async {
        return ErrorResponse<ProductDetailsModel>(error: Exception());
      },);
      var result = await productRepo.getProductDetails("fdsd342412weqs");
      expect(result, isA<ErrorResponse<ProductDetailsModel>>());
      expect((result as ErrorResponse<ProductDetailsModel> ).error.toString(), isNotEmpty);
    });
  },);
}