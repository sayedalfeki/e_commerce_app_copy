import 'package:equatable/equatable.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';

class OccasionStates extends Equatable {
  final BaseState<List<OccasionModel>>? occasionsState;
  final int selectedTabIndex;

  const OccasionStates({this.occasionsState, this.selectedTabIndex = 0});

  OccasionStates copyWith({
    BaseState<List<OccasionModel>>? occasionsState,
    int? selectedTabIndex,
  }) {
    return OccasionStates(
      occasionsState: occasionsState ?? this.occasionsState,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

  @override
  List<Object?> get props => [occasionsState, selectedTabIndex];
}
