import 'package:flutter/material.dart';

import '../../../../../conf/routes/routes.dart';
import '../../../../../core/utils/appColors/app_colors.dart';
import '../../../../../core/utils/common.dart';

class history extends StatelessWidget {
  const history({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Image.asset("lib/core/utils/appImages/images/background.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  navigateReplacement(context: context, route: Routes.home);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: AppColors.primaryColor,
                ),
              ),



            ],
          ),
    ]
      ),
    );
  }
}
