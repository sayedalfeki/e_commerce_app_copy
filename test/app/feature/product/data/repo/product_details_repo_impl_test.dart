import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product/api/data_source_impls/product_details_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/product/data/data_sources/product_remote_data_source_contract.dart';
import 'package:flower_app/app/feature/product/data/models/product/product_dto.dart';
import 'package:flower_app/app/feature/product/data/models/product/product_response.dart';
import 'package:flower_app/app/feature/product/data/models/products/products_response.dart';
import 'package:flower_app/app/feature/product/data/repo/product_repo_impl.dart';
import 'package:flower_app/app/feature/product/domain/models/products_entity.dart';
import 'package:flower_app/app/feature/product/domain/request/query_product_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'product_details_repo_impl_test.mocks.dart';
@GenerateMocks([ProductRemoteDataSourceContract])
void main() {
  late ProductRemoteDataSourceImpl productRemoteDataSource;
  late ProductRepoImpl productRepo;
  late ProductResponse productResponse;
  late ProductsResponse productsResponse;
  late QueryProductRequest queryProductRequest;
  setUpAll(() {
    productRemoteDataSource = MockProductRemoteDataSourceContract();
    productRepo = ProductRepoImpl(productRemoteDataSource);
    productResponse = ProductResponse(
      product: ProductDto(id: "1", title: "flower"),
    );
    productsResponse = ProductsResponse(
      products: [ProductDto(id: "1", title: "flower")],
    );
    queryProductRequest = QueryProductRequest(category: '1');
  }},);


  group("Test Get Product Details function test cases", () {
    test("Test Success case with Product Details", ()async{
      provideDummy<BaseResponse<ProductResponse>>(
          SuccessResponse(data: productResponse));
      when(productRemoteDataSource.getProductDetails("1")).thenAnswer((
          _) async {
        return SuccessResponse<ProductResponse>(data: productResponse);
      },);
      var response = await productRepo.getProductDetails("1");
      expect(response, isA<SuccessResponse<ProductEntity>>());
      expect((response as SuccessResponse<ProductEntity>).data.id, isNotEmpty);
    });
  },);
  test(
    'when calling query product it must get data from data source', () async {
    provideDummy<BaseResponse<ProductsResponse>>(
        SuccessResponse(data: productsResponse));
    when(productRemoteDataSource.getQueryProducts(queryProductRequest))
        .thenAnswer((_) async {
      return SuccessResponse<ProductsResponse>(data: productsResponse);
    },);
    var response = await productRepo.getQueryProducts(queryProductRequest);
    expect(response, isA<SuccessResponse<ProductsEntity>>());
    expect((response as SuccessResponse<ProductsEntity>).data.product?[0].id,
        isNotEmpty);
  },);
}