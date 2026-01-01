import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/product_details/domain/models/product_details_model.dart';
import 'package:flower_app/app/feature/product_details/domain/use_cases/get_product_details_usecase.dart';
import 'package:flower_app/app/feature/product_details/presentation/view_model/product_details_events.dart';
import 'package:flower_app/app/feature/product_details/presentation/view_model/product_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsViewModel extends Cubit<ProductDetailsStates>{
  ProductDetailsViewModel(this._getProductDetailsUsecase):super(ProductDetailsStates());
  GetProductDetailsUsecase _getProductDetailsUsecase;

  void doIntent(ProductDetailsEvents event){
    switch(event){
    
      case GetProductDetailsEvent():
        _getProductDetails(event.productId);
    }
  }

  void _getProductDetails(String productId)async{
    emit(state.copyWith(productDetailsStateParam: BaseState(isLoading: true)));
    var response = await _getProductDetailsUsecase.call(productId);
    switch(response){
      
      case SuccessResponse<ProductDetailsModel>():
        emit(state.copyWith(productDetailsStateParam: BaseState(isLoading: false,data: response.data)));
      case ErrorResponse<ProductDetailsModel>():
        emit(state.copyWith(productDetailsStateParam: BaseState(isLoading: false,errorMessage: response.error as String)));
    }
  }
}