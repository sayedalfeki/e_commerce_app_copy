import 'package:equatable/equatable.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/occasion/data/models/product_model.dart';

class OccasionProductsStates extends Equatable {
  final BaseState<List<ProductModel>> productsState;

  const OccasionProductsStates({required this.productsState});

  OccasionProductsStates copyWith({
    BaseState<List<ProductModel>>? productsState,
  }) {
    return OccasionProductsStates(
      productsState: productsState ?? this.productsState,
    );
  }

  @override
  List<Object?> get props => [productsState];
}
