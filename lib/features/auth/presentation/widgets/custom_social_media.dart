import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/appImages/images/app_assets.dart';

class CustomSocialMedia extends StatelessWidget {
  const CustomSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: SizedBox(
              width: 48.w,
              height: 48.h,
              child: Image.asset(AppAssets.facebook),
            ),
          ),
          InkWell(
            onTap: (){},
            child: SizedBox(
              width: 48.w,
              height: 48.h,
              child: Image.asset(AppAssets.google),
            ),
          ),
          InkWell(
            onTap: (){},
            child: SizedBox(
              width: 48.w,
              height: 48.h,
              child: Image.asset(AppAssets.twitter),
            ),
          ),
          InkWell(
            onTap: (){},
            child: SizedBox(
              width: 48.w,
              height: 48.h,
              child: Image.asset(AppAssets.googlePlus),
            ),
          ),
        ]

    );
  }
}
