sealed class AddressIntent {}

class GetUserAddressesAction extends AddressIntent {}

class DeleteUserAddressAction extends AddressIntent {
  final String id;

  DeleteUserAddressAction(this.id);
}

class UpdateUserAddressAction extends AddressIntent {}
