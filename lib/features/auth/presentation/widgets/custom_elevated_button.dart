import 'package:animeacheck/conf/routes/routes.dart';
import 'package:animeacheck/core/utils/commens.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/appColors/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.data,
  });


  final String data;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: (){
          navigateReplacement(context: context, route: Routes.home);
        },
        child: Container(
          width: 343,
          height: 56,
          padding: const EdgeInsets.symmetric(vertical: 15),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF2BB598), Color(0xFF398272)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
           child: Text(
             data,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.whiteColor,
                fontSize: 20,
                fontFamily: "Kodchasan",
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
