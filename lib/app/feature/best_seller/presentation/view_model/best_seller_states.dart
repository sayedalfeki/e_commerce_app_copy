import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/best_seller/domain/models/best_seller_model.dart';

class BestSellerStates{
  BaseState<List<BestSellerModel>>? getBestSellersState;
  BestSellerStates({this.getBestSellersState});
  BestSellerStates copyWith({BaseState<List<BestSellerModel>>? getBestSellersState}){
    return BestSellerStates(
      getBestSellersState: getBestSellersState ?? this.getBestSellersState
    );
  }
}