import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpDetect extends StatelessWidget {
  const HelpDetect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('lib/core/utils/appImages/images/background.png'),
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 23,
            color: AppColors.primaryColor,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.help,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 24.sp,
                color: AppColors.primaryColor,
                fontFamily: 'Kodchasan',
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/core/utils/appImages/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildHelpText(context, AppLocalizations.of(context)!.helpOne),
              buildImage('lib/core/utils/appImages/images/eyeExample.png',
                  222.w, 158.h),
              buildSeparator(),
              buildHelpText(context, AppLocalizations.of(context)!.helpTwo),
              buildSeparator(),
              buildHelpText(context, AppLocalizations.of(context)!.helpThree),
              buildSeparator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHelpText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget buildImage(String assetPath, double width, double height) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildSeparator() {
    return Container(
      width: 375.w,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColors.lightGrayColor,
          ),
        ),
      ),
    );
  }
}
