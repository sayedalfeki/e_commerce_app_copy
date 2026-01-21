import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/core/validation/app_validators.dart';
import 'package:flower_app/app/feature/profile/domain/model/user_entity.dart';
import 'package:flower_app/app/feature/profile/presentation/update_profile/controller/update_controller.dart';
import 'package:flower_app/app/feature/profile/presentation/update_profile/view/widget/gender_widget.dart';
import 'package:flower_app/app/feature/profile/presentation/update_profile/view/widget/photo_widget.dart';
import 'package:flower_app/app/feature/profile/presentation/update_profile/view/widget/update_button_widget.dart';
import 'package:flower_app/app/feature/profile/presentation/update_profile/view_model/update_profile_intent.dart';
import 'package:flower_app/app/feature/profile/presentation/update_profile/view_model/update_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/utils/helper_function.dart';
import '../../../domain/request/update_profile_request.dart';
import '../controller/gender_controller.dart';
import '../controller/photo_controller.dart';
import '../view_model/update_profile_state.dart';

class UpdateProfileWidget extends StatefulWidget {
  const UpdateProfileWidget({super.key, required this.user});

  final UserEntity user;

  @override
  State<UpdateProfileWidget> createState() => _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GenderController genderController = GenderController();
  final PhotoController photoController = PhotoController();
  final UpdateProfileViewModel updateProfileViewModel =
      getIt<UpdateProfileViewModel>();
  final UpdateController updateController = UpdateController();
  List<Widget> stars = [];
  bool isChanged = false;

  @override
  void initState() {
    super.initState();
    firstNameController.text = widget.user.firstName ?? '';
    lastNameController.text = widget.user.lastName ?? '';
    emailController.text = widget.user.email ?? '';
    phoneController.text = widget.user.phone ?? '';
    genderController.initGender(widget.user.gender ?? '');
  }

  @override
  Widget build(BuildContext context) {
    stars = List.generate(6, (index) {
      return Icon(Icons.star);
    });
    return BlocListener<UpdateProfileViewModel, UpdateProfileState>(
      bloc: updateProfileViewModel,
      listener: (context, state) {
        if (state.profileState.success != null) {
          Navigator.pop(context);
        }
        if (state.profileState.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(getException(context, state.profileState.error!)),
            ),
          );
        }
        if (state.profilePhotoState.success != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.profilePhotoState.success!)),
          );
        }
        if (state.profilePhotoState.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                getException(context, state.profilePhotoState.error!),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 10,
                children: [
                  Center(
                    child: PhotoWidget(
                      photoController: photoController,
                      photoUrl: widget.user.photo ?? '',
                      onChanged: () {
                        if (photoController.photoFile != null) {
                          updateController.changeIsUpdate(true);
                        } else {
                          updateController.changeIsUpdate(false);
                        }
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            if (value != widget.user.firstName) {
                              updateController.changeIsUpdate(true);
                            } else {
                              updateController.changeIsUpdate(false);
                            }
                          },
                          controller: firstNameController,
                          decoration: InputDecoration(
                            labelText: AppLocale(context).firstName,
                          ),
                          validator: (value) =>
                              AppValidators.validateFirstName(value, context),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            if (value != widget.user.lastName) {
                              updateController.changeIsUpdate(true);
                            } else {
                              updateController.changeIsUpdate(false);
                            }
                          },
                          controller: lastNameController,
                          decoration: InputDecoration(
                            labelText: AppLocale(context).lastName,
                          ),
                          validator: (value) =>
                              AppValidators.validateLastName(value, context),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    onChanged: (value) {
                      if (value != widget.user.email) {
                        updateController.changeIsUpdate(true);
                      } else {
                        updateController.changeIsUpdate(false);
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: AppLocale(context).email,
                    ),
                    validator: (value) =>
                        AppValidators.validateEmail(value, context),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      if (value != widget.user.phone) {
                        updateController.changeIsUpdate(true);
                      } else {
                        updateController.changeIsUpdate(false);
                      }
                    },
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: AppLocale(context).phoneNumber,
                    ),
                    validator: (value) =>
                        AppValidators.validateNumberPhone(value, context),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grayColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Row(children: stars),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(AppLocale(context).change),
                        ),
                      ],
                    ),
                  ),
                  GenderWidget(
                    genderController: genderController,
                    onChanged: () {
                      if (genderController.gender != widget.user.gender) {
                        updateController.changeIsUpdate(true);
                      } else {
                        updateController.changeIsUpdate(false);
                      }
                    },
                  ),
                  UpdateButtonWidget(
                    updateController: updateController,
                    onPressed: () {
                      if (!(formKey.currentState?.validate() ?? false)) return;
                      final request = UpdateProfileRequest(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        gender: genderController.gender,
                      );
                      if (isChangedData()) {
                        updateProfileViewModel.doIntent(
                          UpdateProfileAction(request),
                        );
                      }
                      if (photoController.photoFile != null) {
                        updateProfileViewModel.doIntent(
                          UploadProfilePhotoAction(photoController.photoFile!),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isChangedData() {
    if (firstNameController.text != widget.user.firstName ||
        lastNameController.text != widget.user.lastName ||
        emailController.text != widget.user.email ||
        phoneController.text != widget.user.phone ||
        genderController.gender != widget.user.gender) {
      return true;
    }
    return false;
  }
}
