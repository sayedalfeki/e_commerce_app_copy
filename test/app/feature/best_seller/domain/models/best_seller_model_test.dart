import 'package:flower_app/app/feature/best_seller/domain/models/best_seller_model.dart';
import 'package:test/test.dart';

void main() {
  group("BestSellerModel test cases", () {
    test('checking that calculating the discount percentage handled properly', () {
      expect(BestSellerModel(price: 100,priceAfterDiscount: 75).discountPercentage, equals(25));
      expect(BestSellerModel(price: 100,priceAfterDiscount: 0).discountPercentage, equals(15));
      expect(BestSellerModel(price: 0, discount: 10).discountPercentage, 0);
    },);
    test('checking that final price after discount calculated properly', () {
      expect(BestSellerModel(price: 100,priceAfterDiscount: 75).finalPriceAfterDiscount, equals(75));
      expect(BestSellerModel(price: 100,priceAfterDiscount: 0).finalPriceAfterDiscount, equals(85));
      expect(BestSellerModel(price: null).finalPriceAfterDiscount, 0);
    },);
  },);
}