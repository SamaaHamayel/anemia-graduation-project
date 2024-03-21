import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/appColors/app_colors.dart';

class priHome extends StatelessWidget {
  const priHome({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:   Padding(
                    padding: const EdgeInsets.only(left:10.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                            'Welcome,Sarah',
                            textAlign: TextAlign.start,
                            softWrap: true,
                            style: TextStyle(
                            color: AppColors.lightPrimaryColor,
                            fontSize: 18,
                            fontFamily: 'Kodchasan',
                            fontWeight: FontWeight.w600,
                            height: 0,
                            ),
                            ),
              ),
                          SizedBox(
                          width: 351,
                          child: Text(
                          'Start your journey towards better health now.',
                          style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Kodchasan',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          ),
                          ),
                          ),
                          SizedBox(height: 20),
                            Container(
              width: 343,
              height: 149,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color.fromARGB(255, 195, 195, 201)),
              borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
              BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
              )
          ],
          
              ),
              child: Column(
                children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Icon(
                                       Icons.camera_alt_rounded,
                                       color: AppColors.lightPrimaryColor,
                                       size: 25.0,
                                     ),
                 ),
                                     Text(
                                                'Detect Anemia: ',
                                                style: TextStyle(
                                                    color: Color(0xFF2BB598),
                                                    fontSize: 16,
                                                    fontFamily: 'Sunflower',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.10,
                                                ),
                                            ),
                                            SizedBox(height: 10,)
                                        ],
                                    
                                
              
              
              // icon, title
                              ),
          ),
          Row(
            children: [
               SizedBox(
                                  width: 250,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(
                                        'You can take or upload photo for your eyelid to  know whether you have anemia or not',
                                        style: TextStyle(
                                            color: AppColors.lightBlackColor,
                                            fontSize: 13,
                                            fontFamily: 'Kodchasan',
                                            fontWeight: FontWeight.w500,
                                            
                                        ),
                                    ),
                                  ),
                              ),
                              SizedBox(width: 40,),
                                          Column(
                                            children: [
                                              SizedBox(height: 40,),
                                              Padding(
                                              padding: const EdgeInsets.only(top:18.0),
                                                child: Container(
                                                  
                                                    width: 40,
                                                    height: 40,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: BoxDecoration(),
                                                    child: Stack(children: [ 
                                                        Container(
                                                          width: 50,
                                                          height: 50,
                                                           
                                                            decoration: BoxDecoration(
                                                color: AppColors.lightPrimaryColor,
                                                shape: BoxShape.circle,
                                                
                                                            ),
                                                            child: Icon(
                                                Icons.arrow_forward_ios,
                                                color:AppColors.whiteColor
                                                            ),
                                                          ),
                                                    
                                                    ]),
                                                ),
                                              ),
                                            ],
                                          ),
            ],
            //text,backIcon
          )
                ],
          
              ),
                            )
                 
                  
           
                           ,Container(
              width: 343,
              height: 149,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color.fromARGB(255, 195, 195, 201)),
              borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
              BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
              )
          ],
          
              ),
              child: Column(
                children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Icon(
                                       Icons.biotech,
                                       color: AppColors.lightPrimaryColor,
                                       size: 25.0,
                                     ),
                 ),
                                     Text(
                                                'Test Results: ',
                                                style: TextStyle(
                                                    color: Color(0xFF2BB598),
                                                    fontSize: 16,
                                                    fontFamily: 'Kodchasan',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.10,
                                                ),
                                            ),
                                            SizedBox(height: 10,)
                                        ],
                                    
                                
              
              
              // icon, title
                              ),
          ),
          Row(
            children: [
               SizedBox(
                                  width: 250,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(
                                        'Input the required test results to accurately determine the type of anemia you are suffering from.',
                                        style: TextStyle(
                                            color: AppColors.lightBlackColor,
                                            fontSize: 13,
                                            fontFamily: 'Kodchasan',
                                            fontWeight: FontWeight.w500,
                                            
                                        ),
                                    ),
                                  ),
                              ),
                              SizedBox(width: 40,),
                                          Column(
                                            children: [
                                              SizedBox(height: 40,),
                                              Padding(
                                              padding: const EdgeInsets.only(top:18.0),
                                                child: Container(
                                                  
                                                    width: 40,
                                                    height: 40,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: BoxDecoration(),
                                                    child: Stack(children: [ 
                                                        Container(
                                                          width: 50,
                                                          height: 50,
                                                           
                                                            decoration: BoxDecoration(
                                                color: AppColors.lightPrimaryColor,
                                                shape: BoxShape.circle,
                                                
                                                            ),
                                                            child: Icon(
                                                Icons.arrow_forward_ios,
                                                color:AppColors.whiteColor
                                                            ),
                                                          ),
                                                    
                                                    ]),
                                                ),
                                              ),
                                            ],
                                          ),
            ],
            //text,backIcon
          )
                ],
          
              ),
                            )
                 
                  
            
            ,                Container(
              width: 343,
              height: 149,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color.fromARGB(255, 195, 195, 201)),
              borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
              BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
              )
          ],
          
              ),
              child: Column(
                children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Icon(
                                       Icons.person_search_rounded,
                                       color: AppColors.lightPrimaryColor,
                                       size: 25.0,
                                     ),
                 ),
                                     Text(
                                                'Consult a Doctor: ',
                                                style: TextStyle(
                                                    color: Color(0xFF2BB598),
                                                    fontSize: 16,
                                                    fontFamily: 'Kodchasan',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.10,
                                                ),
                                            ),
                                            SizedBox(height: 10,)
                                        ],
                                    
                                
              
              
              // icon, title
                              ),
          ),
          Row(
            children: [
               SizedBox(
                                  width: 250,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(
                                        'Enter your location to discover nearby doctors, and schedule an appointment effortlessly',
                                        style: TextStyle(
                                            color: AppColors.lightBlackColor,
                                            fontSize: 13,
                                            fontFamily: 'Kodchasan',
                                            fontWeight: FontWeight.w500,
                                            
                                        ),
                                    ),
                                  ),
                              ),
                              SizedBox(width: 40,),
                                          Column(
                                            children: [
                                              SizedBox(height: 40,),
                                              Padding(
                                                padding: const EdgeInsets.only(top:18.0),
                                                child: Container(
                                                  
                                                    width: 40,
                                                    height: 40,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: BoxDecoration(),
                                                    child: Stack(children: [ 
                                                        Container(
                                                          width: 50,
                                                          height: 50,
                                                           
                                                            decoration: BoxDecoration(
                                                color: AppColors.lightPrimaryColor,
                                                shape: BoxShape.circle,
                                                
                                                            ),
                                                            child: Icon(
                                                Icons.arrow_forward_ios,
                                                color:AppColors.whiteColor
                                                            ),
                                                          ),
                                                    
                                                    ]),
                                                ),
                                              ),
                                            ],
                                          ),
            ],
            //text,backIcon
          )
                ],
          
              ),
                            )
                 
                  
           ],
          ),
        ),
            
      ),
    );
   
  }
}
