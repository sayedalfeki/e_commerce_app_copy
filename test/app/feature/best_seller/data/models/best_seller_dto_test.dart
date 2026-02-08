import 'package:flower_app/app/feature/best_seller/data/models/best_seller_dto.dart';
import 'package:test/test.dart';

void main() {
  group('BestSellerDTO test cases', () {
    test('fromJson should parse all fields', () {
      final json = {
        '_id': '123',
        'title': 'Test',
        'slug': 'test',
        'description':'test-desc'
      };
      final dto=BestSellerDTO.fromJson(json);
      expect(dto.id, equals(json['_id']));
      expect(dto.title, equals(json['title']));
      expect(dto.description, equals(json['description']));
    },);
    test('toDomain should map only relevant fields', () {
      final dto = BestSellerDTO(
        id: '123',
        title: 'Test',
        imgCover: 'image.jpg',
      );
      final model = dto.toDomain();
      expect(model.id, equals(dto.id));
      expect(model.title, equals(dto.title));
      expect(model.imgCover, equals(dto.imgCover));
    },);
    test('toJson should serialize all fields', () {
      final dto=BestSellerDTO(
        id: '123',
        title:'Test',
        slug: 'test',
        imgCover: 'image.jpg',
        createdAt:  DateTime(2026,1,3),
        updatedAt: DateTime(2026,1,4),
        isSuperAdmin: true
      );
      final json = dto.toJson();
      expect(json['_id'], equals(dto.id));
      expect(json['title'], equals(dto.title));
      expect(json['slug'], equals(dto.slug));
      expect(json['imgCover'], equals(dto.imgCover));
      expect(json['createdAt'], equals(dto.createdAt?.toIso8601String()));
      expect(json['updatedAt'], equals(dto.updatedAt?.toIso8601String()));
      expect(json['isSuperAdmin'], equals(dto.isSuperAdmin));
    },);
  },);
}