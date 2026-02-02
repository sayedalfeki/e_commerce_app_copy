import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/product_details/domain/models/product_details_model.dart';

class ProductDetailsStates {
  BaseState<ProductDetailsModel>? productDetailsState;
  ProductDetailsStates({this.productDetailsState});

  ProductDetailsStates copyWith({BaseState<ProductDetailsModel>? productDetailsStateParam}){
    
    return ProductDetailsStates(productDetailsState: productDetailsStateParam??productDetailsState);
    
  }
}