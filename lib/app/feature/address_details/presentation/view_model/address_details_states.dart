import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/address_details/domain/models/cities_model.dart';
import 'package:flower_app/app/feature/address_details/domain/models/states_model.dart';

class AddressDetailsStates {
  BaseState<String>? addressDetailsState;
  BaseState<List<CitiesModel>>? citiesState;
  BaseState<List<StatesModel>>? statesState;

  AddressDetailsStates({this.addressDetailsState,this.citiesState,this.statesState});

  AddressDetailsStates copyWith({BaseState<String>? addressDetailsStateNew, BaseState<List<CitiesModel>>? citiesStateNew, BaseState<List<StatesModel>>? statesStateNew}) {
    return AddressDetailsStates(
      addressDetailsState: addressDetailsStateNew ?? this.addressDetailsState,
      citiesState: citiesStateNew ?? this.citiesState,
      statesState: statesStateNew ?? this.statesState,
    );
  }
}