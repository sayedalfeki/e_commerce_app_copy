import 'package:flower_app/app/config/base_response/base_response.dart';

import 'package:flower_app/app/feature/address/domain/address_repo_contract.dart';
import 'package:flower_app/app/feature/address/domain/model/user_address_entity.dart';
import 'package:flower_app/app/feature/address/domain/use_case/delete_user_address_use_case.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'get_user_addresses_use_case_test.mocks.dart';

void main() {
  late AddressRepoContract addressRepoImpl;
  late DeleteUserAddressUseCase deleteUserAddressesUseCase;
  late UserAddressEntity userAddressEntity;

  setUpAll(() {
    addressRepoImpl = MockAddressRepoContract();
    deleteUserAddressesUseCase = DeleteUserAddressUseCase(addressRepoImpl);
    userAddressEntity = UserAddressEntity(
      city: 'cairo',
      lat: '123',
      long: '123',
    );
  });

  test('when calling invoke it must call repo', () async {
    provideDummy<BaseResponse<List<UserAddressEntity>>>(
      SuccessResponse(data: [userAddressEntity]),
    );
    when(
      addressRepoImpl.deleteUserAddress('1'),.thenAnswer(
      (_) => Future.value(SuccessResponse(data: [userAddressEntity])),
    );
    await deleteUserAddressesUseCase.invoke('1');
    verify(addressRepoImpl.deleteUserAddress('1'));
  });
}
