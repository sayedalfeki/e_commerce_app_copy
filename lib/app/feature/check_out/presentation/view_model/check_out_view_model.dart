import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/check_out/domain/models/address_model.dart';
import 'package:flower_app/app/feature/check_out/domain/use_cases/get_user_addresses_use_case.dart';
import 'package:flower_app/app/feature/check_out/presentation/view_model/check_out_events.dart';
import 'package:flower_app/app/feature/check_out/presentation/view_model/check_out_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CheckOutViewModel extends Cubit<CheckOutStates>{
  final GetUserAddressesUseCase _checkOutUseCase;
  CheckOutViewModel(this._checkOutUseCase):super(CheckOutStates());
  void doIntent(CheckOutEvents event){
    switch(event){
      
      case GetUserAddressesEvent():
        _getUserAddresses();
    }
  }
  Future<void> _getUserAddresses() async{
    emit(state.copyWith(
      getAddressesState: BaseState<List<AddressModel>>(
        isLoading: true
      )
    ));
    final res=await _checkOutUseCase.call();
    switch(res){
      
      case SuccessResponse<List<AddressModel>>():
        emit(state.copyWith(
          getAddressesState: BaseState<List<AddressModel>>(
            isLoading: false,
            success: res.data
          )
        ));
      case ErrorResponse<List<AddressModel>>():
        emit(state.copyWith(
          getAddressesState: BaseState<List<AddressModel>>(
            isLoading: false,
            error: res.error
          )
        ));
    }
  }
}