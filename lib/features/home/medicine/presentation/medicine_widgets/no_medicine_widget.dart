import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/appColors/app_colors.dart';
import '../../../../../core/utils/appImages/app_assets.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoMedicineWidgets extends StatelessWidget {
  const NoMedicineWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Image.asset(
            AppAssets.noMedicine,
            scale: 0.5,
          ),
        ),
        SizedBox(
          child: Text(
            AppLocalizations.of(context)!.noMedicine,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 20.sp,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w600,
              height: 0.07.h,
            ),
          ),
        ),
      ],
    ));
  }
}
