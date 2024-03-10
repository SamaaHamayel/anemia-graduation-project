import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../conf/routes/routes.dart';
import '../../../../core/utils/commens.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});


  int currentIndex = 0;

  // List<Widget> tabs = [
  //   QuranTap(),
  //   SebhaTap(),
  //   const RadioTap(),
  //   AhdethTap(),
  //   const SettingsTap()
  // ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            navigateReplacement(context: context, route: Routes.signIn);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: AppColors.primaryColor,
          ),
        ),
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 24,
              color: AppColors.primaryColor,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w700),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Quran',
              // backgroundColor: MyThemeData.primaryColor)
            ),BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Quran',
              // backgroundColor: MyThemeData.primaryColor)
            ),BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Quran',
              // backgroundColor: MyThemeData.primaryColor)
            // ),BottomNavigationBarItem(
            //   icon: Icon(Icons.add),
            //   label: 'Quran',
            //   // backgroundColor: MyThemeData.primaryColor)
            // ),BottomNavigationBarItem(
            //   icon: Icon(Icons.add),
            //   label: 'Quran',
              // backgroundColor: MyThemeData.primaryColor)
            )],
      ),
    );
  }
}
