import 'dart:io';

import 'package:flower_app/app/config/base_error/custom_exceptions.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product/api/api_client/api_client.dart';
import 'package:flower_app/app/feature/product/api/data_source_impls/product_details_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/product/data/models/product/product_dto.dart';
import 'package:flower_app/app/feature/product/data/models/product/product_response.dart';
import 'package:flower_app/app/feature/product/data/models/products/products_response.dart';
import 'package:flower_app/app/feature/product/domain/request/query_product_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_details_remote_data_source_impl_test.mocks.dart';
@GenerateMocks([ProductApiClient])
void main() {
  late ProductRemoteDataSourceImpl productDataSource;
  late ProductApiClient productApiClient;
  late QueryProductRequest queryProductRequest;
  late ProductResponse productResponse;
  late ProductsResponse productsResponse;
  setUpAll(() {
    productApiClient = MockProductApiClient();
    productDataSource = ProductRemoteDataSourceImpl(productApiClient);
    queryProductRequest = QueryProductRequest(
        category: '1',
        occasion: '1'
    );
    productResponse = ProductResponse(
        message: 'success',
        product: ProductDto(
          title: 'flower',
        )
    );
    productsResponse = ProductsResponse(
      message: 'success',
      products: [ProductDto(title: 'flower')],
    );
  },);

  group("Product Details test cases", () {
    test("Test Success case with Product Details", ()async{
      when(productApiClient.getProductDetails("1")).thenAnswer((_) async {
        return Future.value(productResponse);
      },);
      var response = await productDataSource.getProductDetails(
          "1") as SuccessResponse<ProductResponse>;
      expect(response, isA<SuccessResponse<ProductResponse>>());
      expect(response.data, equals(productResponse));
    });

    test("Test Error case with Product Details", ()async{
      when(productApiClient.getProductDetails("1")).thenThrow(IOException);
      var result = await productDataSource.getProductDetails(
          "1") as ErrorResponse<ProductResponse>;
      expect(result, isA<ErrorResponse<ProductResponse>>());
      expect((result).error, isA<UnexpectedError>());
    });
  },);
  group("query Product  test cases", () {
    test("Test Success case with query product", () async {
      when(productApiClient.getQueryProducts(queryProductRequest)).thenAnswer((
          _) async {
        return Future.value(productsResponse);
      },);
      var response = await productDataSource.getQueryProducts(
          queryProductRequest) as SuccessResponse<ProductsResponse>;
      expect(response, isA<SuccessResponse<ProductsResponse>>());
      expect((response).data, equals(productsResponse));
    });

    test("Test Error case with query product", () async {
      when(productApiClient.getQueryProducts(queryProductRequest)).thenThrow(
          IOException);
      var result = await productDataSource.getQueryProducts(
          queryProductRequest) as ErrorResponse<ProductsResponse>;
      expect(result, isA<ErrorResponse<ProductsResponse>>());
      expect((result).error.toString(),
          isNotEmpty);
    });
  },);
}