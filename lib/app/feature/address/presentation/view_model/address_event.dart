import '../../domain/model/user_address_entity.dart';

sealed class AddressEvent {}

class NavigateToUpdateAddressEvent extends AddressEvent {
  final UserAddressEntity? address;

  NavigateToUpdateAddressEvent({this.address});
}

class NavigateBackToProfileEvent extends AddressEvent {}
