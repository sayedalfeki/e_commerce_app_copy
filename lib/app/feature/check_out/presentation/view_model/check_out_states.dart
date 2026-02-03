import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/check_out/domain/models/address_model.dart';

class CheckOutStates {
  BaseState<List<AddressModel>>? getAddressesState;
  CheckOutStates({this.getAddressesState});
  CheckOutStates copyWith({BaseState<List<AddressModel>>? getAddressesState}){
    return CheckOutStates(
      getAddressesState: getAddressesState ?? this.getAddressesState
    );
  }
}