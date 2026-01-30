import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/check_out/domain/models/address_model.dart';

abstract class CheckOutRepoContract {
  Future<BaseResponse<List<AddressModel>>> getUserAddresses();
}