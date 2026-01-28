import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/address_details/data/data_sources/address_details_local_data_source_contract.dart';
import 'package:flower_app/app/feature/address_details/data/data_sources/address_details_remote_data_source_contract.dart';
import 'package:flower_app/app/feature/address_details/data/models/add_and_update_addresses_dto.dart';
// ignore: unused_import
import 'package:flower_app/app/feature/address_details/domain/models/cities_model.dart';
import 'package:flower_app/app/feature/address_details/domain/models/states_model.dart';
import 'package:flower_app/app/feature/address_details/domain/repo/address_details_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressDetailsRepoContract)
class AddressDetailsRepoImpl extends AddressDetailsRepoContract {
  final AddressDetailsRemoteDataSourceContract _addressDetailsRemoteDataSourceContract;
  final AddressDetailsLocalDataSourceContract _addressDetailsLocalDataSourceContract;

  AddressDetailsRepoImpl(this._addressDetailsRemoteDataSourceContract, this._addressDetailsLocalDataSourceContract);

  @override
  Future<BaseResponse<String>> addAddress(
      {String? street,
      String? phone,
      String? city,
      String? lat,
      String? long,
      String? username})async{
        var response = await _addressDetailsRemoteDataSourceContract.addAddress(
          street: street,
          phone: phone,
          city: city,
          lat: lat,
          long: long,
          username: username
        );
        switch (response){
          
          case SuccessResponse<AddAndUpdateAddressesDto>():
            return SuccessResponse<String>(data: response.data.message ?? "Address added successfully");
          case ErrorResponse<AddAndUpdateAddressesDto>():
            return ErrorResponse<String>(error: response.error);
        }
      }

  @override
  Future<BaseResponse<String>> updateAddress(
      {String? addressId,
      String? street,
      String? phone,
      String? city,
      String? lat,
      String? long,
      String? username})async {
        var response = await _addressDetailsRemoteDataSourceContract.updateAddress(
          addressId: addressId,
          street: street,
          phone: phone,
          city: city,
          lat: lat,
          long: long,
          username: username
        );
        switch (response){
          case SuccessResponse<AddAndUpdateAddressesDto>():
            return SuccessResponse<String>(data: response.data.message ?? "Address updated successfully");
          case ErrorResponse<AddAndUpdateAddressesDto>():
            return ErrorResponse<String>(error: response.error);
        }
    }
    
  @override
  Future<List<CitiesModel>> getCities({String? selectedStateId})async {
    var response = await _addressDetailsLocalDataSourceContract.getCities();
    if (selectedStateId == null) {
      var cities = response.data!.map((e) => e.toDomain()).toList();
      return cities;
    } else {
      var cities = response.data!.map((e) => e.toDomain()).toList();
      return cities.where((city) => city.id == selectedStateId).toList();
    }
  }
    
  @override
  Future<List<StatesModel>> getStates({String? selectedCityId})async {
    var response = await _addressDetailsLocalDataSourceContract.getStates();
    if (selectedCityId == null) {
      var states = response.data!.map((e) => e.toDomain()).toList();
      return states;
    } else {
      var states = response.data!.map((e) => e.toDomain()).toList();
      return states.where((state) => state.id == selectedCityId).toList();
    }
  }
  
}