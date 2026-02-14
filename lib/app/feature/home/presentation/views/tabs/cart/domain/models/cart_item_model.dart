import 'package:flower_app/app/feature/product/domain/models/products_entity.dart';

class CartItemModel {
  ProductEntity? product;
  int? price;
  int? quantity;
  String? id;
  CartItemModel({this.product,this.id,this.price,this.quantity});
}