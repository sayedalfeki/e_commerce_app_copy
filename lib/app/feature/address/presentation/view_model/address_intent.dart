import '../../domain/model/user_address_entity.dart';

sealed class AddressIntent {}

class GetUserAddressesAction extends AddressIntent {}

class DeleteUserAddressAction extends AddressIntent {
  final String id;

  DeleteUserAddressAction(this.id);
}

class UpdateUserAddressAction extends AddressIntent {
  final UserAddressEntity? address;

  UpdateUserAddressAction({this.address});
}

class BackToProfileScreenAction extends AddressIntent {}
