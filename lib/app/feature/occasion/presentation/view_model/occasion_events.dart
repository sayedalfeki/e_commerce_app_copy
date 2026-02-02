sealed class OccasionEvents {}

class GetAllOccasionsEvent extends OccasionEvents {}

class SelectTabEvent extends OccasionEvents {
  final int index;

  SelectTabEvent(this.index);
}
