import 'dart:io';

import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({super.key, required this.photoUrl, this.photoFile});

  final String photoUrl;
  final File? photoFile;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: photoFile != null
          ? FileImage(photoFile!)
          : NetworkImage(photoUrl),
      backgroundColor: AppColors.transparentColor,
    );
  }
}
