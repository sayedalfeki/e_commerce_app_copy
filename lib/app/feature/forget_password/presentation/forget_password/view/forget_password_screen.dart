
import 'package:flower_app/app/core/custom_widgets/app_dialoge.dart';
import 'package:flower_app/app/core/routes/app_route.dart';
import 'package:flower_app/app/core/utils/helper_function.dart';
import 'package:flower_app/app/feature/forget_password/presentation/forget_password/view/widgets/forget_password_body_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/custom_widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_locale.dart';
import '../view_model/forget_password_event.dart';
import '../view_model/forget_password_intent.dart';
import '../view_model/forget_password_state.dart';
import '../view_model/forget_password_view_model.dart';
class ForgetPasswordScreen extends StatefulWidget {
   const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
final ForgetPasswordViewModel _forgetPasswordViewModel=getIt<ForgetPasswordViewModel>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _forgetPasswordViewModel.cubitStream.listen((event) {
      if(event is BackToLoginNavigationEvent){
        if(Navigator.canPop(context)) {
        Navigator.pop(context);
        }
      }
    });
  }

@override
void dispose() {
  // TODO: implement dispose
  super.dispose();
  emailController.dispose();
}
  final TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocListener<ForgetPasswordViewModel,ForgetPasswordState>(
      bloc: _forgetPasswordViewModel,
      listener: (context, state) {
        if(state.forgetPasswordState.isLoading==true){
          AppDialogue.viewDialogue(context,'');
        }
        if(state.forgetPasswordState.error!=null){
          Navigator.pop(context);
          AppDialogue.viewDialogue(context,
            getException(context, state.forgetPasswordState.error!),
          cancelText: AppLocale(context).cancel,

          );
        }
        if(state.forgetPasswordState.success!=null){
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.forgetPasswordState.success?.info??''),
              duration: const Duration(seconds: 2),
            ),
          );

          Navigator.pushNamed(context, Routes.verifyOtp,arguments:emailController.text );
        }
      },
      child: Scaffold(

            appBar: CustomAppBar(
              text: AppLocale(context).password,
              onLeadingIconClicked: () {
                _forgetPasswordViewModel.doIntent(BackToLoginNavigation());
              },
            ),
            body: ForgetPasswordScreenBody(forgetPasswordViewModel: _forgetPasswordViewModel,
              emailController: emailController,),
          ),
    );
  }
}
