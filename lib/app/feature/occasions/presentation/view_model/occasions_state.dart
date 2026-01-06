import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/occasions/domain/model/all_occasions_entity.dart';

import '../../domain/model/products_occasion_entity.dart';

class OccasionsState {
  final OccasionBaseState allOccasionsState;
  final BaseState<ProductsOccasionEntity> productsOccasionState;
  OccasionsState(
      {required this.allOccasionsState, required this.productsOccasionState});

  OccasionsState copyWith({OccasionBaseState? allOccasionsState,
    BaseState<
        ProductsOccasionEntity>? productsOccasionState, bool clearSuccess = false, bool clearError = false}) {
    return OccasionsState(
        allOccasionsState: OccasionBaseState(
          isLoading: allOccasionsState?.isLoading ??
              this.allOccasionsState.isLoading,
          success: allOccasionsState?.success ?? this.allOccasionsState.success,
          error: allOccasionsState?.error ?? this.allOccasionsState.error,
          index: allOccasionsState?.index ?? this.allOccasionsState.index,
        ),
        productsOccasionState: BaseState(
          isLoading: productsOccasionState?.isLoading ??
              this.productsOccasionState.isLoading,
          success: clearSuccess ? null : (productsOccasionState?.success ??
              this.productsOccasionState.success),
          error: clearError ? null : (productsOccasionState?.error ??
              this.productsOccasionState.error),
        )
    );
  }
}

class OccasionBaseState extends BaseState<AllOccasionsEntity> {
  const OccasionBaseState(
      {this.index = 0, super.isLoading, super.success, super.error});

  final int index;
}
