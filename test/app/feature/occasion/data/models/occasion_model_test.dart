import 'package:flutter_test/flutter_test.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';

void main() {
  group('OccasionModel', () {
    final json = {
      '_id': '673b34c21159920171827ae0',
      'name': 'Wedding',
      'slug': 'wedding',
      'image': 'https://example.com/wedding.jpg',
      'createdAt': '2024-11-18T12:36:18.366Z',
      'updatedAt': '2024-11-18T12:36:18.366Z',
      'isSuperAdmin': true,
      'productsCount': 4,
    };

    test('creates from JSON', () {
      final occasion = OccasionModel.fromJson(json);

      expect(occasion.id, '673b34c21159920171827ae0');
      expect(occasion.name, 'Wedding');
      expect(occasion.slug, 'wedding');
      expect(occasion.image, 'https://example.com/wedding.jpg');
      expect(occasion.createdAt, '2024-11-18T12:36:18.366Z');
      expect(occasion.updatedAt, '2024-11-18T12:36:18.366Z');
      expect(occasion.isSuperAdmin, true);
      expect(occasion.productsCount, 4);
    });

    test('converts to JSON', () {
      final occasion = OccasionModel(
        id: '673b34c21159920171827ae0',
        name: 'Wedding',
        slug: 'wedding',
        image: 'https://example.com/wedding.jpg',
        createdAt: '2024-11-18T12:36:18.366Z',
        updatedAt: '2024-11-18T12:36:18.366Z',
        isSuperAdmin: true,
        productsCount: 4,
      );

      final result = occasion.toJson();

      expect(result, json);
    });

    test('handles null fields with defaults', () {
      final occasion = OccasionModel.fromJson(<String, dynamic>{});

      expect(occasion.id, '');
      expect(occasion.name, '');
      expect(occasion.slug, '');
      expect(occasion.image, '');
      expect(occasion.createdAt, '');
      expect(occasion.updatedAt, '');
      expect(occasion.isSuperAdmin, false);
      expect(occasion.productsCount, 0);
    });

    test('handles partial JSON', () {
      final occasion = OccasionModel.fromJson({
        '_id': '123',
        'name': 'Birthday',
      });

      expect(occasion.id, '123');
      expect(occasion.name, 'Birthday');
      expect(occasion.slug, '');
      expect(occasion.image, '');
      expect(occasion.productsCount, 0);
    });
  });
}
