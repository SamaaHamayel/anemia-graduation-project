import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/history/presentation/view/history.dart';
import 'package:animeacheck/features/home/medicine/presentation/view/medicine_screen.dart';
import 'package:animeacheck/features/home/my_account/presentation/view/my_account.dart';
import 'package:animeacheck/features/home/pri_home/presentation/view/pri_home.dart';
import 'package:animeacheck/features/home/setting/presentation/view/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../setting/presentation/settings_cubit/settings_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    const PriHome(),
    const History(),
    const Setting(),
    MyAccount()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Image(
          image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
              ? const AssetImage('lib/core/utils/appImages/images/backgroundDark.png')
              : const AssetImage('lib/core/utils/appImages/images/background.png'),
          fit: BoxFit.cover,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor:
                  BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                      ? AppColors.darkGreen
                      : AppColors.lightPrimaryColor,
              child: Image.asset(
                AppAssets.female,
                width: double.infinity,
              ),
            ),
            Image.asset(
                BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                    ? ('lib/core/utils/appImages/images/logoDark.png')
                    : ('lib/core/utils/appImages/images/logo.png'),
                scale: 2),
            IconButton(
              icon: Icon(
                Icons.assignment_add,
                color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                    ? AppColors.whiteColor
                    : AppColors.lightPrimaryColor,
              ), // Icon to display
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MedicineScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? const AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                : const AssetImage('lib/core/utils/appImages/images/background.png'),
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
            image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? const AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                : const AssetImage('lib/core/utils/appImages/images/background.png'),
            fit: BoxFit.cover, // Optional: You can set the image fit as needed
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 20.w),
          child: GNav(
            activeColor: Colors.white,
            color: const Color.fromARGB(255, 146, 146, 153),
            tabBackgroundColor:
                BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                    ? const Color.fromARGB(255, 32, 84, 69)
                    : AppColors.lightPrimaryColor,
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
