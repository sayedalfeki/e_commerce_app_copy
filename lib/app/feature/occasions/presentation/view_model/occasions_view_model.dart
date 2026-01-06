import 'package:flower_app/app/config/base_state/custom_cubit.dart';
import 'package:flower_app/app/feature/occasions/domain/model/products_occasion_entity.dart';
import 'package:flower_app/app/feature/occasions/domain/use_case/get_all_occasions_use_case.dart';
import 'package:flower_app/app/feature/occasions/presentation/view_model/occasions_event.dart';
import 'package:flower_app/app/feature/occasions/presentation/view_model/occasions_intent.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../../../config/base_state/base_state.dart';
import '../../domain/use_case/get_products_occasion_use_case.dart';
import 'occasions_state.dart';

@injectable
class OccasionsViewModel extends CustomCubit<OccasionsEvent, OccasionsState> {
  final GetAllOccasionsUseCase _allOccasionsUseCase;
  final GetProductsOccasionUseCase _productsOccasionUseCase;

  OccasionsViewModel(this._allOccasionsUseCase, this._productsOccasionUseCase)
    : super(
        OccasionsState(
          allOccasionsState: OccasionBaseState(),
          productsOccasionState: BaseState(),
        ),
      );
  late var baseState = state;

  Future<void> _getAllOccasions() async {
    baseState = state.copyWith(
      allOccasionsState: OccasionBaseState(isLoading: true),
    );
    emit(baseState);
    final response = await _allOccasionsUseCase.invoke();
    switch (response) {
      case SuccessResponse():
        baseState = state.copyWith(
          allOccasionsState: OccasionBaseState(
            isLoading: false,
            success: response.data,
          ),
        );
        emit(baseState);
        _getProductsOccasion(
          '${state.allOccasionsState.success?.occasionsEntity?[0].id}',
        );
        break;
      case ErrorResponse():
        baseState = state.copyWith(
          allOccasionsState: OccasionBaseState(
            isLoading: false,
            error: response.error,
          ),
        );
        emit(baseState);
        break;
    }
  }

  void _getOccasion(int index) {
    baseState = state.copyWith(
      allOccasionsState: OccasionBaseState(index: index),
    );
    emit(baseState);
    _getProductsOccasion(
      '${state.allOccasionsState.success?.occasionsEntity?[index].id}',
    );
  }

  Future<void> _getProductsOccasion(String occasionId) async {
    emit(state.copyWith(
        productsOccasionState: BaseState(isLoading: true,),
        clearSuccess: true,
        clearError: true
    ));
    final response = await _productsOccasionUseCase.invoke(occasionId);
    switch (response) {
      case SuccessResponse<ProductsOccasionEntity>():
        emit(state.copyWith(
          productsOccasionState: BaseState(
            isLoading: false,
            success: response.data,
          ),
            clearError: true
        ));
        // emit(baseState);
        break;
      case ErrorResponse<ProductsOccasionEntity>():
        emit(state.copyWith(
          productsOccasionState: BaseState(
            isLoading: false,
            success: null,
            error: response.error,
          ),
            clearSuccess: true
        ));
        // emit(baseState);
        break;
    }
  }

  void doIntent(OccasionsIntent intent) {
    switch (intent) {
      case AllOccasionsIntent():
        _getAllOccasions();
        break;
      case GetOccasionIntent():
        _getOccasion((intent.index));
        break;
      case GetProductsOccasionIntent():
        _getProductsOccasion(intent.occasionId);
    }
  }
}
