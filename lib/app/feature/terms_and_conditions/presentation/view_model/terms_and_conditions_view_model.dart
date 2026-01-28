import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_section.dart';
import 'package:flower_app/app/feature/terms_and_conditions/domain/use_cases/get_terms_use_case.dart';
import 'package:flower_app/app/feature/terms_and_conditions/presentation/view_model/terms_and_conditions_events.dart';
import 'package:flower_app/app/feature/terms_and_conditions/presentation/view_model/terms_and_conditions_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class TermsAndConditionsViewModel extends Cubit<TermsAndConditionsStates>{
  final GetTermsUseCase _getTermsUseCase;
  TermsAndConditionsViewModel(this._getTermsUseCase):super(TermsAndConditionsStates());
  void doIntent(TermsAndConditionsEvents event){
    switch(event){
      
      case GetTermsAndConditionsEvent():
        _getTermsAndConditions();
    }
  }
  Future<void> _getTermsAndConditions()async{
    emit(state.copyWith(
      getTermsState: BaseState<List<TermsSection>>(
        isLoading: true
      )
    ));
    final res=await _getTermsUseCase.call();
    switch(res){
      
      case SuccessResponse<List<TermsSection>>():
        emit(state.copyWith(
          getTermsState: BaseState<List<TermsSection>>(
            isLoading: false,
            success: res.data
          )
        ));
      case ErrorResponse<List<TermsSection>>():
        emit(state.copyWith(
          getTermsState: BaseState<List<TermsSection>>(
            isLoading: false,
            error: res.error
          )
        ));
    }
  }
}