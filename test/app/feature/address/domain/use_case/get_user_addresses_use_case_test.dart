import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/address/data/address_repo_impl.dart';
import 'package:flower_app/app/feature/address/domain/address_repo_contract.dart';
import 'package:flower_app/app/feature/address/domain/model/user_address_entity.dart';
import 'package:flower_app/app/feature/address/domain/use_case/get_user_addresses_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_addresses_use_case_test.mocks.dart';

@GenerateMocks([AddressRepoContract])
void main() {
  late AddressRepoContract addressRepoImpl;
  late GetUserAddressesUseCase getUserAddressesUseCase;
  late UserAddressEntity userAddressEntity;

  setUpAll(() {
    addressRepoImpl = MockAddressRepoContract();
    getUserAddressesUseCase = GetUserAddressesUseCase(addressRepoImpl);
    userAddressEntity = UserAddressEntity(
      city: 'cairo',
      lat: '123',
      long: '123',
    );
  });

  test('when calling get user addresses it must call repo', () async {
    provideDummy<BaseResponse<List<UserAddressEntity>>>(
      SuccessResponse(data: [userAddressEntity]),
    );
    when(
      addressRepoImpl.getUserAddresses(),
    ).thenAnswer((_) async => SuccessResponse(data: [userAddressEntity]));
    var result = await getUserAddressesUseCase.invoke();
    expect(result, SuccessResponse(data: [userAddressEntity]));
    verify(addressRepoImpl.getUserAddresses());
  });
}
