import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/product/domain/models/products_entity.dart';


class ProductDetailsStates {
  BaseState<ProductEntity>? productDetailsState;
  ProductDetailsStates({this.productDetailsState});

  ProductDetailsStates copyWith(
      {BaseState<ProductEntity>? productDetailsStateParam}) {
    return ProductDetailsStates(
        productDetailsState: productDetailsStateParam ?? productDetailsState);
    
  }
}