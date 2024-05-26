import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/appImages/app_assets.dart';
import '../../auth/presentation/widgets/custom_image.dart';


class CustomFileImage extends StatelessWidget {
  const CustomFileImage(
      {super.key, this.image, this.height, this.width, this.fit,});
  final XFile? image;
  final double? height;
  final double? width;
  final BoxFit? fit;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150.h,
        width: 220.w,
         child: image != null
          ? Image.file(
          File(image!.path)
      )
              : const CustomImage(imagePath: AppAssets.imageDetect),
    );
  }
}
