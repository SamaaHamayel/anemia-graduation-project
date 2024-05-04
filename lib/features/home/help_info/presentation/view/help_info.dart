import 'package:animeacheck/features/home/help_info/presentation/view/Iron_deficiency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/home/help_info/presentation/view/Thalassemia.dart';
import 'package:animeacheck/features/home/pri_home/presentation/view/pri_home.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpfulInformationScreen extends StatelessWidget {
  const HelpfulInformationScreen({Key? key}) : super(key: key);
  Future<void> launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await launchUrl (uri)) {
      await canLaunchUrl 
      (uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.lightPrimaryColor,
                size: 23.sp,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 30.w),
            Text(
              AppLocalizations.of(context)!.helpfulInformation,
              style: TextStyle(
                color: AppColors.lightPrimaryColor,
                fontSize: 19.sp,
                fontFamily: 'Kodchasan',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 1.76,
              ),
            ),
          ],
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //1
                buildInfoContainer(
                  title: AppLocalizations.of(context)!.buildInfoContainerTitle1,
                  description: AppLocalizations.of(context)!
                      .buildInfoContainerDescription1,
                  onPressedRead: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IronDeficiency()),
                    );
                  },
                  onPressedWatch: () async {
                    await launchURL(
                        'https://youtu.be/ltuxwOnhA_s?si=EUlelQEUw9b5BT5E');
                  },
                ),
                const SizedBox(height: 10.0),
                //2
                buildInfoContainer(
                  title: AppLocalizations.of(context)!.buildInfoContainerTitle2,
                  description: AppLocalizations.of(context)!
                      .buildInfoContainerDescription2,
                  onPressedRead: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Thalassemia()),
                    );
                  },
                  onPressedWatch: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PriHome()),
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                //3
                buildInfoContainer(
                  title: AppLocalizations.of(context)!.buildInfoContainerTitle3,
                  description: AppLocalizations.of(context)!
                      .buildInfoContainerDescription3,
                  onPressedRead: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Thalassemia()),
                    );
                  },
                  onPressedWatch: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PriHome()),
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                //4
                buildInfoContainer(
                  title: AppLocalizations.of(context)!.buildInfoContainerTitle4,
                  description: AppLocalizations.of(context)!
                      .buildInfoContainerDescription4,
                  onPressedRead: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Thalassemia()),
                    );
                  },
                  onPressedWatch: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PriHome()),
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                //5
                buildInfoContainer(
                  title: AppLocalizations.of(context)!.buildInfoContainerTitle5,
                  description: AppLocalizations.of(context)!
                      .buildInfoContainerDescription5,
                  onPressedRead: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Thalassemia()),
                    );
                  },
                  onPressedWatch: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PriHome()),
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                //6
                buildInfoContainer(
                  title: AppLocalizations.of(context)!.buildInfoContainerTitle6,
                  description: AppLocalizations.of(context)!
                      .buildInfoContainerDescription6,
                  onPressedRead: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Thalassemia()),
                    );
                  },
                  onPressedWatch: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PriHome()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoContainer({
    required String title,
    required String description,
    required VoidCallback onPressedRead,
    required VoidCallback onPressedWatch,
  }) {
    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 00.0),
        child: Container(
          width: 345.w,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColors.lightBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.r)),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Image.asset(
                  'lib/core/utils/appImages/images/anemia.png',
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18.sp,
                        fontFamily: 'Kumbh Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Text(
                        description,
                        style: TextStyle(
                          color: AppColors.grayColor,
                          fontSize: 14.sp,
                          fontFamily: 'Kumbh Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 19.50,
                                right: 19.50,
                                bottom: 7,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1.50.w,
                                    color: AppColors.lightPrimaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: TextButton(
                                onPressed: onPressedRead,
                                child: Text(
                                  AppLocalizations.of(context)!.readArticle,
                                ),
                              ),
                            ),
                            SizedBox(width: 24),
                            Container(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 19.50,
                                right: 18.50,
                                bottom: 7,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    AppColors.lightPrimaryColor,
                                    AppColors.primaryColor
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.whiteColor),
                                ),
                                onPressed: onPressedWatch,
                                child: Text(
                                  AppLocalizations.of(context)!.watchVideo,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

