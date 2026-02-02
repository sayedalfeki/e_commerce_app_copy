import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_section.dart';

class TermsAndConditionsStates {
  BaseState<List<TermsSection>>? getTermsState;
  TermsAndConditionsStates({this.getTermsState});
  TermsAndConditionsStates copyWith({BaseState<List<TermsSection>>? getTermsState}){
    return TermsAndConditionsStates(
      getTermsState: getTermsState ?? this.getTermsState
    );
  }
}