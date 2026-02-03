import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/best_seller/domain/models/best_seller_model.dart';
import 'package:flower_app/app/feature/best_seller/domain/use_cases/best_seller_use_case.dart';
import 'package:flower_app/app/feature/best_seller/presentation/view_model/best_seller_events.dart';
import 'package:flower_app/app/feature/best_seller/presentation/view_model/best_seller_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class BestSellerViewModel extends Cubit<BestSellerStates>{
  final BestSellerUseCase _bestSellerUseCase;
  BestSellerViewModel(this._bestSellerUseCase):super(BestSellerStates());
  void doIntent(BestSellerEvents event){
    switch(event){
      
      case GetBestSellersEvent():
        _getBestSellers();
    }
  }
  Future<void> _getBestSellers() async{
    emit(state.copyWith(
      getBestSellersState: BaseState<List<BestSellerModel>>(
        isLoading: true
      )
    ));
    final response=await _bestSellerUseCase.call();
    switch (response){
      
      case SuccessResponse<List<BestSellerModel>>():
        emit(state.copyWith(
          getBestSellersState: BaseState<List<BestSellerModel>>(
            isLoading: false,
            success: response.data
          )
        ));
      case ErrorResponse<List<BestSellerModel>>():
        emit(state.copyWith(
          getBestSellersState: BaseState<List<BestSellerModel>>(
            isLoading: false,
            error: response.error
          )
        ));
    }
  }
}