import 'dart:io';

import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product/api/api_client/api_client.dart';
import 'package:flower_app/app/feature/product/api/data_source_impls/product_details_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/product/data/models/product/product_response.dart';
import 'package:flower_app/app/feature/product/data/models/products/products_response.dart';
import 'package:flower_app/app/feature/product/domain/request/query_product_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
@GenerateMocks([ProductApiClient])
void main() {
  late ProductRemoteDataSourceImpl productDataSource;
  late ProductApiClient productApiClient;
  late QueryProductRequest queryProductRequest;
  setUpAll(() {
    productApiClient = MockProductApiClient();
    productDataSource = ProductRemoteDataSourceImpl(productApiClient);
    queryProductRequest = QueryProductRequest(
        category: '1',
        occasion: '1'
    );
  },);

  group("Product Details test cases", () {
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
  group("query Product  test cases", () {
    test("Test Success case with query product", () async {
      when(productApiClient.getQueryProducts(queryProductRequest)).thenAnswer((
          _) async {
        return Future.value(ProductsResponse());
      },);
      var response = await productDataSource.getQueryProducts(
          queryProductRequest);
      expect(response, isA<SuccessResponse<ProductsResponse>>());
      expect((response as SuccessResponse<ProductsResponse>).data.message,
          isNotEmpty);
    });

    test("Test Error case with query product", () async {
      when(productApiClient.getQueryProducts(queryProductRequest)).thenThrow(
          IOException);
      var result = await productDataSource.getQueryProducts(
          queryProductRequest);
      expect(result, isA<ErrorResponse<ProductsResponse>>());
      expect((result as ErrorResponse<ProductsResponse>).error.toString(),
          isNotEmpty);
    });
  },);
}