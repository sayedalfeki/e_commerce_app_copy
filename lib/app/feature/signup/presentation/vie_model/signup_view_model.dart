
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/signup/domain/use_cases/signup_usecase.dart';
import 'package:flower_app/app/feature/signup/presentation/vie_model/signup_events.dart';
import 'package:flower_app/app/feature/signup/presentation/vie_model/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupViewModel extends Cubit<SignupStates>{
  SignupUsecase _signup;

    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    String? gender;

  SignupViewModel(this._signup):super(SignupStates());

  void doIntent(SignupEvents event){
    switch (event){
      case SignupEvent():
        _signUp(event.gender, event.firstName, event.lastName, event.email, event.password, event.rePassword, event.phone);
    }
  }

  void _signUp (String gender ,String firstName , String lastName , String email , String password , String rePassword , String phone)async{
    emit(state.copyWith(signupStateParam: BaseState(isLoading: true)));
    final signupResponse = await _signup.call(gender, firstName, lastName, email, password, rePassword, phone);

    switch(signupResponse){
      case SuccessResponse():
        emit(state.copyWith(signupStateParam: BaseState(success: signupResponse.data,isLoading: false)));
      case ErrorResponse():
        emit(state.copyWith(signupStateParam: BaseState(error: signupResponse.error ,isLoading: false)));
    }
  }

}