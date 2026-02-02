import 'package:flower_app/app/config/di/di.dart';
import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/resources/values_manager.dart';
import 'package:flower_app/app/core/utils/helper_function.dart';
import 'package:flower_app/app/feature/terms_and_conditions/presentation/view_model/terms_and_conditions_events.dart';
import 'package:flower_app/app/feature/terms_and_conditions/presentation/view_model/terms_and_conditions_states.dart';
import 'package:flower_app/app/feature/terms_and_conditions/presentation/view_model/terms_and_conditions_view_model.dart';
import 'package:flower_app/app/feature/terms_and_conditions/presentation/views/widget/terms_section_widget.dart';
import 'package:flower_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  final TermsAndConditionsViewModel viewModel=getIt<TermsAndConditionsViewModel>();
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon:Icon(Icons.arrow_back_ios,color: AppColors.blackColor,) 
        ),
        title: Text(AppLocalizations.of(context)!.terms_and_conditions,
        style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(fontSize: AppSize.s24),),
      ),
      body: BlocProvider<TermsAndConditionsViewModel>(
        create: (context) => viewModel..doIntent(GetTermsAndConditionsEvent()),
        child: BlocBuilder<TermsAndConditionsViewModel,TermsAndConditionsStates>(
          builder: (context, state) {
            final termsState=state.getTermsState;
            if(termsState?.isLoading==false && termsState?.error!=null){
              return Center(child: Text(getException(context, termsState!.error!)),);
            }else if(termsState?.isLoading==false && termsState?.success!=null){
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 0.04*width),
                itemBuilder: (context, index) {
                  return TermsSectionWidget(
                    section: termsState.success![index],
                    language:Localizations.localeOf(context).languageCode,
                  );
                }, 
                separatorBuilder: (context, index) {
                  return SizedBox(height: 0.01*height,);
                }, 
                itemCount: termsState!.success!.length
              );
            }else{
              return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
            }
          },
        ),
      ),
    );
  }
}