import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/product/domain/models/products_entity.dart';
import 'package:flower_app/app/feature/product/presentation/view_model/product_event.dart';
import 'package:flower_app/app/feature/product/presentation/view_model/product_intent.dart';
import 'package:flower_app/app/feature/product/presentation/view_model/product_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_state/custom_cubit.dart';
import '../../domain/use_cases/get_product_details_usecase.dart';
@injectable
class ProductDetailsViewModel
    extends CustomCubit<ProductEvent, ProductDetailsStates> {
  ProductDetailsViewModel(this._getProductDetailsUseCase)
      :super(ProductDetailsStates());
  final GetProductDetailsUseCase _getProductDetailsUseCase;

  void doIntent(ProductIntent intent) {
    switch (intent) {
      case GetProductDetailsAction():
        _getProductDetails(intent.productId);
      case NavigateToProductDetailsAction():
        streamController.add(
            NavigateToProductDetailsEvent(productId: intent.productId ?? ''));
      case AddToCartAction():
        streamController.add(
            AddToCartEvent(productId: intent.productId, name: intent.name));
        break;
    }
  }

  void _getProductDetails(String productId)async{
    emit(state.copyWith(productDetailsStateParam: BaseState(isLoading: true)));
    var response = await _getProductDetailsUseCase.call(productId);
    switch(response){
      case SuccessResponse<ProductEntity>():
        emit(state.copyWith(productDetailsStateParam: BaseState(isLoading: false,success: response.data)));
      case ErrorResponse<ProductEntity>():
        emit(state.copyWith(productDetailsStateParam: BaseState(isLoading: false,error: response.error)));
    }
  }
}