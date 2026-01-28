import 'dart:convert';
import 'package:flower_app/app/feature/address_details/data/data_sources/address_details_local_data_source_contract.dart';
import 'package:flower_app/app/feature/address_details/data/models/cities_dto.dart';
import 'package:flower_app/app/feature/address_details/data/models/countres_dto.dart';
import 'package:flower_app/app/feature/address_details/data/models/states_dto.dart';
import 'package:flutter/services.dart';

class  AddressDetailsLocalDataSourceImpl extends AddressDetailsLocalDataSourceContract {
  @override
  Future<CitiesDto> getCities() async {
    var response = rootBundle.loadString('assets/jsonFiles/cities.json');
    return CitiesDto.fromJson(jsonDecode(await response));
  }

  @override
  Future<CountresDto> getCountries() async {
    var response = rootBundle.loadString('assets/jsonFiles/country.json');
    return CountresDto.fromJson(jsonDecode(await response));
  }

  @override
  Future<StatesDto> getStates() async {
    var response = rootBundle.loadString('assets/jsonFiles/states.json');
    return StatesDto.fromJson(jsonDecode(await response));
  }

}