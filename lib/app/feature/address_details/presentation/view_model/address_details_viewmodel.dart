
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/address_details/domain/use_cases/add_address_usecase.dart';
import 'package:flower_app/app/feature/address_details/domain/use_cases/get_cities_usecase.dart';
import 'package:flower_app/app/feature/address_details/domain/use_cases/get_states_usecase.dart';
import 'package:flower_app/app/feature/address_details/domain/use_cases/update_address_usecase.dart';
import 'package:flower_app/app/feature/address_details/presentation/view_model/address_details_events.dart';
import 'package:flower_app/app/feature/address_details/presentation/view_model/address_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';


class AddressDetailsViewmodel extends Cubit<AddressDetailsStates>{
  AddressDetailsViewmodel(this._addAddressUsecase,this._updateAddressUsecase,this._getCitiesUsecase,this._getStatesUsecase):super(AddressDetailsStates());

  AddAddressUsecase _addAddressUsecase;
  UpdateAddressUsecase _updateAddressUsecase;
  GetCitiesUsecase _getCitiesUsecase;
  GetStatesUsecase _getStatesUsecase;
  



  void doIntent(AddressDetailsEvents event){
    switch (event) {
      case AddAddressEvent():
        _addAddress(
          street: event.street,
          phone: event.phone,
          city: event.city,
          lat: event.lat,
          long: event.long,
          username: event.username
        );
      case UpdateAddressEvent():
        _updateAddress(
          addressId: event.addressId,
          street: event.street,
          phone: event.phone,
          city: event.city,
          lat: event.lat,
          long: event.long,
          username: event.username
        );
      case getAddressFromCoordinatesEvent():
        _getAddressFromCoordinates(
          lat: event.latitude,
          lng: event.longitude
        );

      case GetStatesEvent():
        _getStates(
          selectedCityId: event.selectedCityId
        );
      case GetCitiesEvent():
        _getCities(
          selectedStateId: event.selectedStateId
        );
      case GetCitiesAndStatesEvent():
        _getCitiesAndStates();
    }

  }


  void _addAddress({String? street,String? phone,String? city,String? lat,String? long,String? username}) async {
    emit(state.copyWith(addressDetailsStateNew: BaseState(isLoading: true)));
    var response = await _addAddressUsecase.call(
      street: street,
      phone: phone,
      city: city,
      lat: lat,
      long: long,
      username: username
    );
   switch (response){
      case SuccessResponse<String>():
        emit(state.copyWith(addressDetailsStateNew: BaseState(success: response.data)));
      case ErrorResponse<String>():
        emit(state.copyWith(addressDetailsStateNew: BaseState(error: response.error)));
    }
    
  }

  void _updateAddress({String? addressId, String? street, String? phone, String? city, String? lat, String? long, String? username}) async {
    emit(state.copyWith(addressDetailsStateNew: BaseState(isLoading: true)));
    var response = await _updateAddressUsecase.call(
      addressId: addressId,
      street: street,
      phone: phone,
      city: city,
      lat: lat,
      long: long,
      username: username
    );
   switch (response){
      case SuccessResponse<String>():
        emit(state.copyWith(addressDetailsStateNew: BaseState(success: response.data)));
      case ErrorResponse<String>():
        emit(state.copyWith(addressDetailsStateNew: BaseState(error: response.error)));
    }
    
  }

  void _getAddressFromCoordinates({required double lat, required double lng}) async {
    emit(state.copyWith(addressDetailsStateNew: BaseState(isLoading: true)));
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    String address = '${placemarks[0].street}, ${placemarks[0].country}';
    emit(state.copyWith(addressDetailsStateNew: BaseState(success: address)));
  }

  void _getStates({String? selectedCityId}) async {
    emit(state.copyWith(addressDetailsStateNew: BaseState(isLoading: true)));
    var response = await _getStatesUsecase.call(selectedCityId: selectedCityId);
    emit(state.copyWith(statesStateNew: BaseState(success: response)));
  }

  void _getCities({String? selectedStateId}) async {
    emit(state.copyWith(addressDetailsStateNew: BaseState(isLoading: true)));
    var response = await _getCitiesUsecase.call(selectedStateId: selectedStateId);
    emit(state.copyWith(citiesStateNew: BaseState(success: response)));
  }

  void _getCitiesAndStates() async {
    emit(state.copyWith(addressDetailsStateNew: BaseState(isLoading: true)));
    var statesResponse = await _getStatesUsecase.call();
    var citiesResponse = await _getCitiesUsecase.call();
    emit(state.copyWith(
      statesStateNew: BaseState(success: statesResponse),
      citiesStateNew: BaseState(success: citiesResponse)
    ));
  }

  

}