import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/check_out/data/models/user_address_response.dart';

abstract class CheckOutRemoteDataSourceContract {
  Future<BaseResponse<UserAddressResponse>> getUserAddressesResponse();
}