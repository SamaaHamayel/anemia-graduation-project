import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/appImages/app_assets.dart';
import '../../../auth/presentation/widgets/custom_image.dart';


class CustomEditProfileFileImage extends StatelessWidget {
  const CustomEditProfileFileImage(
      {super.key, this.image, this.height, this.width, this.fit,});
  final XFile? image;
  final double? height;
  final double? width;
  final BoxFit? fit;


  @override
  Widget build(BuildContext context) {
    return image != null
        ? Image.file(
        File(image!.path)
    ): const CustomImage(imagePath: AppAssets.fmale);



  }
}
