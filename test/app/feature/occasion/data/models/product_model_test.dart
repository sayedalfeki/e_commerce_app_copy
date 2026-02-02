import 'package:flutter_test/flutter_test.dart';
import 'package:flower_app/app/feature/occasion/data/models/product_model.dart';

void main() {
  group('ProductModel', () {
    final json = {
      '_id': '673e1cd711599201718280fb',
      'title': 'Wedding Flower',
      'slug': 'wedding-flower',
      'description': 'Beautiful wedding flowers',
      'imgCover': 'https://example.com/flower.jpg',
      'images': ['image1.jpg', 'image2.jpg'],
      'price': 250,
      'priceAfterDiscount': 150,
      'quantity': 100,
      'category': 'cat123',
      'occasion': 'occ123',
      'sold': 50,
      'rateAvg': 4.5,
      'rateCount': 10,
    };

    test('creates from JSON', () {
      final product = ProductModel.fromJson(json);

      expect(product.id, '673e1cd711599201718280fb');
      expect(product.title, 'Wedding Flower');
      expect(product.slug, 'wedding-flower');
      expect(product.description, 'Beautiful wedding flowers');
      expect(product.imgCover, 'https://example.com/flower.jpg');
      expect(product.images, ['image1.jpg', 'image2.jpg']);
      expect(product.price, 250.0);
      expect(product.priceAfterDiscount, 150.0);
      expect(product.quantity, 100);
      expect(product.category, 'cat123');
      expect(product.occasion, 'occ123');
      expect(product.sold, 50);
      expect(product.rateAvg, 4.5);
      expect(product.rateCount, 10);
    });

    test('converts to JSON', () {
      final product = ProductModel(
        id: '673e1cd711599201718280fb',
        title: 'Wedding Flower',
        slug: 'wedding-flower',
        description: 'Beautiful wedding flowers',
        imgCover: 'https://example.com/flower.jpg',
        images: ['image1.jpg', 'image2.jpg'],
        price: 250.0,
        priceAfterDiscount: 150.0,
        quantity: 100,
        category: 'cat123',
        occasion: 'occ123',
        sold: 50,
        rateAvg: 4.5,
        rateCount: 10,
      );

      final result = product.toJson();

      expect(result, json);
    });

    test('calculates discount percentage', () {
      final product = ProductModel(
        id: '1',
        title: 'Test',
        slug: 'test',
        description: 'Test',
        imgCover: 'test.jpg',
        images: [],
        price: 200.0,
        priceAfterDiscount: 150.0,
        quantity: 10,
        category: 'cat',
        occasion: 'occ',
        sold: 0,
        rateAvg: 0,
        rateCount: 0,
      );

      expect(product.discountPercentage, 25);
    });

    test('returns 0 discount when price is 0', () {
      final product = ProductModel(
        id: '1',
        title: 'Test',
        slug: 'test',
        description: 'Test',
        imgCover: 'test.jpg',
        images: [],
        price: 0.0,
        priceAfterDiscount: 0.0,
        quantity: 10,
        category: 'cat',
        occasion: 'occ',
        sold: 0,
        rateAvg: 0,
        rateCount: 0,
      );

      expect(product.discountPercentage, 0);
    });

    test('handles missing fields with defaults', () {
      final product = ProductModel.fromJson(<String, dynamic>{});

      expect(product.id, '');
      expect(product.title, '');
      expect(product.price, 0.0);
      expect(product.priceAfterDiscount, 0.0);
      expect(product.quantity, 0);
      expect(product.images, isEmpty);
    });
  });
}
