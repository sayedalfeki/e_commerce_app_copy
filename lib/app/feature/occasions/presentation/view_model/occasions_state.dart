import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/occasions/domain/model/all_occasions_entity.dart';

class OccasionsState {
  final BaseState<AllOccasionsEntity> allOccasionsState;

  OccasionsState({required this.allOccasionsState});

  OccasionsState copyWith(BaseState<AllOccasionsEntity>? allOccasionsState) {
    return OccasionsState(
      allOccasionsState: allOccasionsState ?? this.allOccasionsState,
    );
  }
}
