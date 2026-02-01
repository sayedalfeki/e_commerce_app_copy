import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/product/domain/models/products_entity.dart';
import 'package:flower_app/app/feature/product/presentation/view_model/product_details_events.dart';
import 'package:flower_app/app/feature/product/presentation/view_model/product_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/get_product_details_usecase.dart';
@injectable
class ProductDetailsViewModel extends Cubit<ProductDetailsStates>{
  ProductDetailsViewModel(this._getProductDetailsUseCase)
      :super(ProductDetailsStates());
  final GetProductDetailsUseCase _getProductDetailsUseCase;

  void doIntent(ProductDetailsEvents event){
    switch(event){
    
      case GetProductDetailsEvent():
        _getProductDetails(event.productId);
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