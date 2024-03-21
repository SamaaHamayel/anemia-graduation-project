import 'package:flutter/material.dart';

import '../../../../core/utils/appColors/app_colors.dart';

class dettected extends StatelessWidget {
  const dettected({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:40.0),
              child: Row(
                 children: [
              
              const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 25.0,
              ),
              SizedBox(width: 85,),
              Text(
'Detect Anemia',
style: TextStyle(
color: Colors.white,
fontSize: 22,
fontFamily: 'Kodchasan',
fontWeight: FontWeight.w700,
height: 0,
letterSpacing: 1.76,
),
)

                 ],
                
                //title,icon
              ),
           
            ),
                           SizedBox(height: 50,),

            
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                       Padding(
                         padding: const EdgeInsets.only(bottom: 30.0),
                         child: Image.asset(
                          'lib/core/utils/appImages/images/detect.png',
                                           scale: 1,
                                           
                                         ),
                       ),
                                      SizedBox(height: 30,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: 333,
                    child: Text(
                        'You can take or upload photo for your eyelid to  know whether you have anemia or not',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Kodchasan',
                                fontWeight: FontWeight.w600,
                        ),
                    ),
                                ),
                ),
                               SizedBox(height: 50,),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                    width: 335,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                        ),
                    ),
                    child: Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: const Icon(
                  Icons.camera_alt_rounded,
                  color: AppColors.lightPrimaryColor,
                  size: 40.0,
                ),
                    ),
                ),
              )
               , 
               SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                    width: 335,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                        ),
                    ),
                    child: Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: const Icon(
                  Icons.upload_file,
                  color: AppColors.lightPrimaryColor,
                  size: 40.0,
                ),
                    ),
                ),
              )
                ],
              ),
            )
          ],
        
          
        ),
      ),
    );
  }
}
