import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/history/presentation/view/history.dart';
import 'package:animeacheck/features/home/my_account/presentation/view/my_account.dart';
import 'package:animeacheck/features/home/pri_home/presentation/view/pri_home.dart';
import 'package:animeacheck/features/home/setting/presentation/view/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    const PriHome(),
    const history(),
    const Setting(),
    MyAccount()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.lightPrimaryColor,
                child: Image.asset(
                  AppAssets.female,
                  width: double.infinity,
                ),
              ),
              Image.asset(
                'lib/core/utils/appImages/images/logo (2).png',
                scale: 2,
              ),
              const Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
                size: 30.0,
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/core/utils/appImages/images/background.png'),
            fit: BoxFit.cover, // Optional: You can set the image fit as needed
          ),
        ),
        child: Center(
          child: pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/core/utils/appImages/images/background.png'),
            fit: BoxFit.cover, // Optional: You can set the image fit as needed
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.w),
          child: GNav(
            activeColor: Colors.white,
            color: const Color.fromARGB(255, 146, 146, 153),
            tabBackgroundColor: AppColors.lightPrimaryColor,
            gap: 8.h,
            padding: const EdgeInsets.all(16),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: FontAwesomeIcons.house,
                // icon: Icon(FontAwesomeIcons.house),
                text: AppLocalizations.of(context)!.home,
              ),
              GButton(
                icon: (FontAwesomeIcons.calendarDays),
                text: AppLocalizations.of(context)!.history,
              ),
              GButton(
                icon: (Icons.settings),
                text: AppLocalizations.of(context)!.settings,
              ),
              GButton(
                icon: (Icons.person),
                text: AppLocalizations.of(context)!.myAccount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
