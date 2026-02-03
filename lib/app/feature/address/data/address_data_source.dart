import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/address/data/model/user_address_response.dart';

abstract class AddressDataSource {
  Future<BaseResponse<UserAddressResponse>> getUserAddresses();

  Future<BaseResponse<UserAddressResponse>> deleteUserAddress(String id);
}
