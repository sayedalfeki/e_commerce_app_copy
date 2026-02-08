import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';
import 'package:flower_app/app/feature/occasion/domain/use_cases/get_all_occasions_use_case.dart';
import 'package:flower_app/app/feature/occasion/presentation/view_model/occasion_events.dart';
import 'package:flower_app/app/feature/occasion/presentation/view_model/occasion_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionViewModel extends Cubit<OccasionStates> {
  final GetAllOccasionsUseCase _getAllOccasionsUseCase;

  OccasionViewModel(this._getAllOccasionsUseCase)
    : super(const OccasionStates());

  void doIntent(OccasionEvents event) {
    switch (event) {
      case GetAllOccasionsEvent():
        _getAllOccasions();
        break;
      case SelectTabEvent():
        _selectTab(event.index);
        break;
    }
  }

  Future<void> _getAllOccasions() async {
    emit(state.copyWith(occasionsState: BaseState(isLoading: true)));

    final response = await _getAllOccasionsUseCase();

    switch (response) {
      case SuccessResponse<List<OccasionModel>>():
        emit(
          state.copyWith(
            occasionsState: BaseState(isLoading: false, success: response.data),
          ),
        );
        break;
      case ErrorResponse<List<OccasionModel>>():
        emit(
          state.copyWith(
            occasionsState: BaseState(
              isLoading: false,
              error: Exception(response.error.toString()),
            ),
          ),
        );
        break;
    }
  }

  void _selectTab(int index) {
    emit(state.copyWith(selectedTabIndex: index));
  }

  OccasionModel? get selectedOccasion {
    final occasions = state.occasionsState?.success ?? [];
    if (occasions.isEmpty || state.selectedTabIndex >= occasions.length) {
      return null;
    }
    return occasions[state.selectedTabIndex];
  }
}
