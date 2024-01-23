import 'package:flutter/material.dart';

import '../../../../core/utils/appColors/app_colors.dart';
import '../../../../core/utils/appString/app_strings.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          const Expanded(
              child: Divider(
                color: AppColors.primaryColor,
                indent: 16,
                endIndent: 9,
              )
          ),
          Text(AppStrings.or,style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.blackColor,
              fontSize: 13,
              fontFamily: "Kodchasan",
              fontWeight: FontWeight.w600
          ),),
          const Expanded(
              child: Divider(
                color: AppColors.primaryColor,
                indent: 16,
                endIndent: 9,
              )
          ),
        ]
    );
  }
}
