import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/test/view/presentation/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CBCInputField extends StatelessWidget {
  final String label;
  final String value;
  final List<String> options;
  final Function(String) onChanged;

  const CBCInputField({
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: Text(
                '$label:',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 25.sp,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.w),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.5.w, color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: [
                  BoxShadow(
                    color: AppColors.whiteColor,
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: DropdownButton<String>(
                  value: value,
                  icon: Icon(
                    Icons.expand_more,
                    color: AppColors.lightPrimaryColor,
                    size: 30.sp,
                  ),
                  style: TextStyle(
                    color: AppColors.lightPrimaryColor,
                    fontSize: 23.h,
                    fontWeight: FontWeight.w400,
                  ),
                  underline: Container(
                    height: 0.h,
                    color: AppColors.lightPrimaryColor,
                  ),
                  onChanged: (newValue) => onChanged(newValue!),
                  items: options
                      .map<DropdownMenuItem<String>>(
                        (option) => DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.w,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CBCTest extends StatefulWidget {
  const CBCTest({Key? key}) : super(key: key);

  @override
  State<CBCTest> createState() => CBCTestState();
}

class CBCTestState extends State<CBCTest> {
  String dropdownRBC = "normal";
  String dropdownWCB = "normal";
  String dropdownHB = "normal";
  String dropdownMCV = "normal";
  String dropdownPLT = "normal";
  String dropdownMCH = "normal";
  String dropdownMCHC = "normal";
    String dropdownRDW = "normal";
  String dropdownHct = "normal";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(  decoration: BoxDecoration(
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
              SizedBox(width: 85.w),
              Text(
                'CBC Test',
                style: TextStyle(
                  color: AppColors.lightPrimaryColor,
                  fontSize: 23.sp,
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
      backgroundColor: Colors.white,
      body: Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/core/utils/appImages/images/background.png'),
            fit: BoxFit.cover, // Optional: You can set the image fit as needed
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(9.w),
                child: SizedBox(
                  child: Text(
                    'Enter the results of a CBC test on the screen to determine the type of anemia.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontFamily: 'Kumbh Sans',
                      fontWeight: FontWeight.w400,
                      height: 0.h,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CBCInputField(
                        label: 'RBC',
                        value: dropdownRBC,
                        options: ['normal', 'less', 'greater'],
                        onChanged: (newValue) {
                          setState(() {
                            dropdownRBC = newValue;
                          });
                        },
                      ),
                      CBCInputField(
                        label: 'WCB',
                        value: dropdownWCB,
                        options: ['normal', 'less', 'greater'],
                        onChanged: (newValue) {
                          setState(() {
                            dropdownWCB = newValue;
                          });
                        },
                      ),
                      CBCInputField(
                        label: ' HB  ',
                        value: dropdownHB,
                        options: ['normal', 'less', 'greater'],
                        onChanged: (newValue) {
                          setState(() {
                            dropdownHB = newValue;
                          });
                        },
                      ),
                      CBCInputField(
                        label: 'MCV',
                        value: dropdownMCV,
                        options: ['normal', 'less', 'greater'],
                        onChanged: (newValue) {
                          setState(() {
                            dropdownMCV = newValue;
                          });
                        },
                      ),
                      CBCInputField(
                        label: 'PLT ',
                        value: dropdownPLT,
                        options: ['normal', 'less', 'greater'],
                        onChanged: (newValue) {
                          setState(() {
                            dropdownPLT = newValue;
                          });
                        },
                      ),
                      CBCInputField(
                        label: 'MCH',
                        value: dropdownMCH,
                        options: ['normal', 'less', 'greater'],
                        onChanged: (newValue) {
                          setState(() {
                            dropdownMCH = newValue;
                          });
                        },
                      ),
                      CBCInputField(
                        label: 'RDW',
                        value: dropdownRDW,
                        options: ['normal', 'less', 'greater'],
                        onChanged: (newValue) {
                          setState(() {
                            dropdownRDW = newValue;
                          });
                        },
                      ),
                      CBCInputField(
                        label: 'Hct',
                        value: dropdownHct,
                        options: ['normal', 'less', 'greater'],
                        onChanged: (newValue) {
                          setState(() {
                            dropdownHct = newValue;
                          });
                        },
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CBCInputField(
                            label: 'MCHC',
                            value: dropdownMCHC,
                            options: ['normal', 'less', 'greater'],
                            onChanged: (newValue) {
                              setState(() {
                                dropdownMCHC = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    width: 172.w,
                    height: 48.h,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [
                          AppColors.lightPrimaryColor,
                          AppColors.primaryColor
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => resultTest()),
                        );
                        setState(() {});
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.whiteColor,
                        padding: EdgeInsets.zero,
                        textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.whiteColor,
                          fontFamily: 'Kodchasan',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: Text('See the result'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
