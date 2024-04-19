import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/history/presentation/view/history.dart';
import 'package:animeacheck/features/home/my_account/presentation/view/my_account.dart';
import 'package:animeacheck/features/home/pri_home/presentation/view/pri_home.dart';
import 'package:animeacheck/features/home/setting/presentation/view/setting.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> pages = [PriHome(), history(), setting(), myAccount()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
      body: Center(
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          backgroundColor: Colors.white,
          activeColor: Colors.white,
          color: const Color.fromARGB(255, 146, 146, 153),
          tabBackgroundColor: AppColors.lightPrimaryColor,
          gap: 8,
          padding: EdgeInsets.all(16),
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
              text: 'Home',
            ),
            GButton(
              icon: (FontAwesomeIcons.calendarDays),
              text: 'History',
            ),
            GButton(
              icon: (Icons.settings),
              text: 'Setting',
            ),
            GButton(
              icon: (Icons.person),
              text: 'MyAccount',
            ),
          ],
        ),
      ),
      
    );
  }
}
