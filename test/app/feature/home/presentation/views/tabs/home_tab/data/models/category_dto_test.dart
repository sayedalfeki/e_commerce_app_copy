
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/category_dto.dart';
import 'package:test/test.dart';

void main() {
  group('CategoryDTO test cases', () {
    test('fromJson should parse all fields', () {
      final json = {
        '_id': '123',
        'name': 'Test',
        'slug': 'test',
        'image': 'image.jpg',
        'createdAt': '2023-01-01T00:00:00.000Z',
        'updatedAt': '2023-01-02T00:00:00.000Z',
        'isSuperAdmin': true,
      };
      final dto=CategoryDTO.fromJson(json);
      expect(dto.id,equals(json['_id']));
      expect(dto.name, equals(json['name']));
      expect(dto.isSuperAdmin, equals(json['isSuperAdmin']));
    },);
    test('toDomain should map only relevant fields', () {
      final dto=CategoryDTO(
        id: '123',
        name: 'Test',
        image: 'image.jpg',
      );
      final model=dto.toDomain();
      expect(model.id, equals(dto.id));
      expect(model.name, equals(dto.name));
      expect(model.image, equals(dto.image));
    },);
    test('toJson should serialize all fields', () {
      final dto=CategoryDTO(
        id: '123',
        name:'Test',
        slug: 'test',
        image: 'image.jpg',
        createdAt:  DateTime(2026,1,3),
        updatedAt: DateTime(2026,1,4),
        isSuperAdmin: true
      );
      final json = dto.toJson();
      expect(json['_id'], equals(dto.id));
      expect(json['name'], equals(dto.name));
      expect(json['slug'], equals(dto.slug));
      expect(json['image'], equals(dto.image));
      expect(json['createdAt'], equals(dto.createdAt?.toIso8601String()));
      expect(json['updatedAt'], equals(dto.updatedAt?.toIso8601String()));
      expect(json['isSuperAdmin'], equals(dto.isSuperAdmin));
    },);
  },);
}