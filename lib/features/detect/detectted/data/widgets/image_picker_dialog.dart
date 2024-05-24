import 'package:flutter/material.dart';

import '../../../../../core/utils/appColors/app_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({
    super.key, required this.cameraOnTap, required this.galleryOnTap,
  });

  final VoidCallback cameraOnTap;
  final VoidCallback galleryOnTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //!! Camera
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
              color: AppColors.primaryColor,
            ),
            title: Text(
              AppLocalizations.of(context)!.camera,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!.copyWith(
                  color: AppColors.primaryColor,
                fontSize: 20
              ),
            ),
            onTap: cameraOnTap,
          ),
          //!!gallery
          ListTile(
            leading: const Icon(
              Icons.photo,
              color: AppColors.primaryColor,
            ),
            title: Text(
              AppLocalizations.of(context)!.gallery,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!.copyWith(
                  color: AppColors.primaryColor,
                fontSize: 20
              ),
            ),
            onTap: galleryOnTap,
          ),
        ],
      ),
    );
  }
}
