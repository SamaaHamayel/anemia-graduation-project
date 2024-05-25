// Article model class
import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Article {
  final String title;
  final String image;
  final String content;

  Article({required this.title, required this.image, required this.content});
}

// Article detail screen
class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(
          image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
              ?const AssetImage('lib/core/utils/appImages/images/backgroundDark.png')
              :const AssetImage('lib/core/utils/appImages/images/background.png'),
          fit: BoxFit.cover,
        ),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                    ? AppColors.whiteColor
                    : AppColors.lightPrimaryColor,
                size: 20.sp,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 10.w),
            Text(
              (article.title),
              style: TextStyle(
                color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                    ? AppColors.whiteColor
                    : AppColors.lightPrimaryColor,
                fontSize: 16.sp,
                fontFamily: 'Kodchasan',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ?const AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                :const AssetImage('lib/core/utils/appImages/images/background.png'),
            fit: BoxFit.cover, // Optional: You can set the image fit as needed
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display article title
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     article.title,
              //     style: TextStyle(
              //       fontSize: 24,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // Display article image
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 345.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color:
                        BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                            ? AppColors.darkThemBlackColor
                            : AppColors.lightBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.r)),
                    ),
                  ),
                  child: Image.asset(
                    'lib/core/utils/appImages/images/anemia.png',
                    // width: double.infinity,
                    scale: 0.5,
                  ),
                ),
              ),
              // Display article content
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  article.content,
                  style: TextStyle(fontSize: 24.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
