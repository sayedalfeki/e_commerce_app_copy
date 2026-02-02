import 'dart:io';

import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product/api/api_client/api_client.dart';
import 'package:flower_app/app/feature/product/api/data_source_impls/product_details_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/product/data/models/product/product_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([ProductApiClient])
void main() {
  late ProductRemoteDataSourceImpl productDataSource;
  late ProductApiClient productApiClient;
  setUpAll(() {
    productApiClient = MockProductApiClient();
    productDataSource = ProductRemoteDataSourceImpl(productApiClient);
  },);

  group("Test Get Product Details function test cases", () {
    test("Test Success case with Product Details", ()async{
      when(productApiClient.getProductDetails("1")).thenAnswer((_) async {
        return Future.value(ProductResponse());
      },);
      var response = await productDataSource.getProductDetails("1");
      expect(response, isA<SuccessResponse<ProductResponse>>());
      expect((response as SuccessResponse<ProductResponse>).data.message,
          isNotEmpty);
    });

    test("Test Error case with Product Details", ()async{
      when(productApiClient.getProductDetails("1")).thenThrow(IOException);
      var result = await productDataSource.getProductDetails("1");
      expect(result, isA<ErrorResponse<ProductResponse>>());
      expect((result as ErrorResponse<ProductResponse>).error.toString(),
          isNotEmpty);
    });
  },);
}