import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/occasion/data/models/product_model.dart';
import 'package:flower_app/app/feature/occasion/domain/use_cases/get_products_by_occasion_use_case.dart';
import 'package:flower_app/app/feature/occasion/presentation/view_model/occasion_products_events.dart';
import 'package:flower_app/app/feature/occasion/presentation/view_model/occasion_products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionProductsViewModel extends Cubit<OccasionProductsStates> {
  final GetProductsByOccasionUseCase _getProductsByOccasionUseCase;

  OccasionProductsViewModel(this._getProductsByOccasionUseCase)
    : super(OccasionProductsStates(productsState: BaseState()));

  void doIntent(OccasionProductsEvents event) {
    switch (event) {
      case GetProductsForOccasionEvent():
        _getProducts(event.occasionId);
        break;
    }
  }

  Future<void> _getProducts(String occasionId) async {
    if (occasionId.isEmpty) return;

    emit(
      state.copyWith(
        productsState: BaseState<List<ProductModel>>(isLoading: true),
      ),
    );

    final response = await _getProductsByOccasionUseCase(occasionId);

    switch (response) {
      case SuccessResponse<List<ProductModel>>():
        emit(
          state.copyWith(
            productsState: BaseState<List<ProductModel>>(
              isLoading: false,
              success: response.data,
            ),
          ),
        );
      case ErrorResponse<List<ProductModel>>():
        emit(
          state.copyWith(
            productsState: BaseState<List<ProductModel>>(
              isLoading: false,
              error: response.error,
            ),
          ),
        );
    }
  }
}
