import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/help_info/presentation/view/article_detail.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpfulInformationScreen extends StatelessWidget {
  const HelpfulInformationScreen({Key? key}) : super(key: key);
  Future<void> launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      await canLaunchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('lib/core/utils/appImages/images/background.png'),
          fit: BoxFit.cover,
        ),
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('lib/core/utils/appImages/images/background.png'),
              fit:
                  BoxFit.cover, // Optional: You can set the image fit as needed
            ),
          ),
          child: Row(
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
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
         image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable ?AssetImage('lib/core/utils/appImages/images/backgroundDark.png') :AssetImage('lib/core/utils/appImages/images/background.png'),
            fit: BoxFit.cover, // Optional: You can set the image fit as needed
          ),
        ),
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                      onPressed: () async {
                        await launchURL(
                            'https://www.youtube.com/watch?v=ZaOhQ1C8dtg&t=160s&pp=ygUt2KfZitmF2KfZhiDYp9mE2KfZhdin2YUg2KfZhNin2LPYqNiq2KfZhNmK2Kkg');
                      },
                      child: Text(
                        AppLocalizations.of(context)!.watchAGeneralVideo,
                      ),
                    ),
                  ),

                  //1
                  buildInfoContainer(
                    title:
                        AppLocalizations.of(context)!.buildInfoContainerTitle1,
                    description: AppLocalizations.of(context)!
                        .buildInfoContainerDescription1,
                    onPressedRead: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailScreen(
                            article: Article(
                              title: AppLocalizations.of(context)!
                                  .buildInfoContainerTitle1,
                              image: AppAssets.anemic,
                              content: AppLocalizations.of(context)!.content1,
                            ),
                          ),
                        ),
                      );
                    },
                    onPressedReadMore: () async {
                      await launchURL(
                          'https://www.mayoclinic.org/diseases-conditions/iron-deficiency-anemia/symptoms-causes/syc-20355034');
                    },
                    onPressedWatch: () async {
                      await launchURL(
                          'https://youtu.be/ltuxwOnhA_s?si=EUlelQEUw9b5BT5E');
                    },
                  ),
                  const SizedBox(height: 10.0),
                  //2
                  buildInfoContainer(
                    title:
                        AppLocalizations.of(context)!.buildInfoContainerTitle2,
                    description: AppLocalizations.of(context)!
                        .buildInfoContainerDescription2,
                    onPressedRead: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailScreen(
                            article: Article(
                              title: AppLocalizations.of(context)!
                                  .buildInfoContainerTitle2,
                              image: AppAssets.anemic,
                              content: AppLocalizations.of(context)!.content2,
                            ),
                          ),
                        ),
                      );
                    },
                    onPressedReadMore: () async {
                      await launchURL(
                          'https://www.ncbi.nlm.nih.gov/books/NBK545151/');
                    },
                    onPressedWatch: () async {
                      await launchURL(
                          'https://youtu.be/6emOCXysZZc?si=Rgl9SMbNqj62hSxA');
                    },
                  ),
                  const SizedBox(height: 10.0),
                  //3
                  buildInfoContainer(
                    title:
                        AppLocalizations.of(context)!.buildInfoContainerTitle3,
                    description: AppLocalizations.of(context)!
                        .buildInfoContainerDescription3,
                    onPressedRead: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailScreen(
                            article: Article(
                              title: AppLocalizations.of(context)!
                                  .buildInfoContainerTitle3,
                              image: AppAssets.anemic,
                              content: AppLocalizations.of(context)!.content3,
                            ),
                          ),
                        ),
                      );
                    },
                    onPressedReadMore: () async {
                      await launchURL(
                          'https://my.clevelandclinic.org/health/diseases/22831-vitamin-b12-deficiency');
                    },
                    onPressedWatch: () async {
                      await launchURL(
                          'https://youtu.be/nX7bLq0VSeQ?si=dK5ll3gldGGjekqY');
                    },
                  ),
                  const SizedBox(height: 10.0),
                  //4
                  buildInfoContainer(
                    title:
                        AppLocalizations.of(context)!.buildInfoContainerTitle4,
                    description: AppLocalizations.of(context)!
                        .buildInfoContainerDescription4,
                    onPressedRead: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailScreen(
                            article: Article(
                              title: AppLocalizations.of(context)!
                                  .buildInfoContainerTitle4,
                              image: AppAssets.anemic,
                              content: AppLocalizations.of(context)!.content4,
                            ),
                          ),
                        ),
                      );
                    },
                    onPressedReadMore: () async {
                      await launchURL(
                          'https://my.clevelandclinic.org/health/diseases/24196-folate-deficiency-anemia');
                    },
                    onPressedWatch: () async {
                      await launchURL(
                          'https://youtu.be/HPSpcPg37hI?si=iB4bfRupX73YOMVk');
                    },
                  ),
                  const SizedBox(height: 10.0),
                  //5
                  buildInfoContainer(
                    title:
                        AppLocalizations.of(context)!.buildInfoContainerTitle5,
                    description: AppLocalizations.of(context)!
                        .buildInfoContainerDescription5,
                    onPressedRead: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailScreen(
                            article: Article(
                              title: AppLocalizations.of(context)!
                                  .buildInfoContainerTitle5,
                              image: AppAssets.anemic,
                              content: AppLocalizations.of(context)!.content5,
                            ),
                          ),
                        ),
                      );
                    },
                    onPressedReadMore: () async {
                      await launchURL(
                          'https://www.mayoclinic.org/diseases-conditions/sickle-cell-anemia/symptoms-causes/syc-20355876');
                    },
                    onPressedWatch: () async {
                      await launchURL(
                          'https://youtu.be/fIIJmg_1hv0?si=ydPsvSb4eQLAYT8v');
                    },
                  ),
                  const SizedBox(height: 10.0),
                  //6
                  buildInfoContainer(
                    title:
                        AppLocalizations.of(context)!.buildInfoContainerTitle6,
                    description: AppLocalizations.of(context)!
                        .buildInfoContainerDescription6,
                    onPressedRead: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailScreen(
                            article: Article(
                              title: AppLocalizations.of(context)!
                                  .buildInfoContainerTitle6,
                              image: AppAssets.anemic,
                              content: AppLocalizations.of(context)!.content6,
                            ),
                          ),
                        ),
                      );
                    },
                    onPressedReadMore: () async {
                      await launchURL(
                          'https://health.clevelandclinic.org/rheumatoid-arthritis-anemia');
                    },
                    onPressedWatch: () async {
                      await launchURL(
                          'https://youtu.be/NXv2b0bdNRs?si=f-8SiGd0Qn5-opDf');
                    },
                  ),
                ],
              ),
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
    required VoidCallback onPressedReadMore,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                        child: Column(
                          children: [
                            Center(
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
                                        AppLocalizations.of(context)!
                                            .readArticle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
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
                                        AppLocalizations.of(context)!
                                            .watchVideo,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
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
                                      AppColors.whiteColor,
                                      AppColors.lightPrimaryColor
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
                                  onPressed: onPressedReadMore,
                                  child: Text(
                                    AppLocalizations.of(context)!.readMore,
                                  ),
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
