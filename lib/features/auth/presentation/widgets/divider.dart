import 'package:flutter/material.dart';

import '../../../../core/utils/appColors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
          Text(AppLocalizations.of(context)!.or,style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
