import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/best_seller_dto.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/category_dto.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/get_home_tab_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/occasion_dto.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/best_seller_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/category_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/get_home_tab_response_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/occasion_model.dart';
import 'package:test/test.dart';

void main() {
  group('GetHomeTabResponse test cases', () {
    test('fromJson should parse nested List structures', () {
      final json={
        'categories':[{'id':'id1'}],
        'bestSeller': [{'id': 'id1'}],
        'occasions': [{'_id': 'id1'}],
      };
      final response=GetHomeTabResponse.fromJson(json);
      expect(response.categories?.length, equals(1));
      expect(response.bestSeller?.length, equals(1));
      expect(response.occasions?.length, equals(1));
    },);
    test('toDomain should convert all nested DTO lists', () {
      final response = GetHomeTabResponse(
      categories: [CategoryDTO(id: '1')],
      bestSeller: [BestSellerDTO(id: '1')],
      occasions: [OccasionDTO(id: '1')],
    );
    final model=response.toDomain();
    expect(model, isA<GetHomeTabResponseModel>());
    expect(model.categories, isA<List<CategoryModel>>());
    expect(model.bestSellers, isA<List<BestSellerModel>>());
    expect(model.occasions, isA<List<OccasionModel>>());
    expect(model.categories?.length, equals(1));
    expect(model.bestSellers?.length, equals(1));
    expect(model.occasions?.length, equals(1));
    },);
  },);
}