import 'package:flower_app/app/feature/address/domain/model/user_address_entity.dart';

import '../../../config/base_response/base_response.dart';

abstract class AddressRepoContract {
  Future<BaseResponse<List<UserAddressEntity>>> getUserAddresses();

  Future<BaseResponse<List<UserAddressEntity>>> deleteUserAddress(String id);
}
