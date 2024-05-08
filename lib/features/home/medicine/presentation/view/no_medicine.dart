import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/core/utils/app_text_them.dart';
import 'package:animeacheck/features/home/medicine/presentation/view/MedicineContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoMedicineScreen extends StatefulWidget {
  const NoMedicineScreen({super.key});

  @override
  State<NoMedicineScreen> createState() => NoMedicineScreenState();
}

class NoMedicineScreenState extends State<NoMedicineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('lib/core/utils/appImages/images/background.png'),
              fit:
                  BoxFit.cover, // Optional: You can set the image fit as needed
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                            SizedBox(width: 25.w),
                            Text(
                              AppLocalizations.of(context)!.medicineReminder,
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
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Image.asset(
                            AppAssets.noMedicine,
                            scale: 0.5,
                          ),
                        ),
                        SizedBox(
                          width: 351,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 56),
                              SizedBox(
                                width: 351.w,
                                child: Text(
                                  AppLocalizations.of(context)!.noMedicine,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 20.sp,
                                    fontFamily: 'Kodchasan',
                                    fontWeight: FontWeight.w600,
                                    height: 0.07.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 64.w,
                                    height: 64.h,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: AppColors.lightPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: AppColors.whiteColor,
                                        size: 30.sp,
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SingleChildScrollView(
                                                child: Container(
                                                  width: 375.w,
                                                  height: 539.h,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: AppColors
                                                        .lightBackgroundColor,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(24.r),
                                                        topRight:
                                                            Radius.circular(24.r),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                15.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          30.0),
                                                                  child: Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .addNewMedicine,
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .lightPrimaryColor,
                                                                      fontSize:
                                                                          24.sp,
                                                                      fontFamily:
                                                                          'Kodchasan',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      height: 0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                                TextButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                    'X',
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .lightPrimaryColor,
                                                                        fontSize:
                                                                            20.sp),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          24,
                                                                      vertical:
                                                                          20),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      UnderlineInputBorder(),
                                                                  hintText:
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .name,
                                                                  hintStyle: TextStyle(
                                                                      fontSize:
                                                                          20.sp,
                                                                      color: AppColors
                                                                          .grayColor),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          24,
                                                                      vertical:
                                                                          20),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      UnderlineInputBorder(),
                                                                  hintText:
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .dose,
                                                                  hintStyle: TextStyle(
                                                                      fontSize:
                                                                          20.sp,
                                                                      color: AppColors
                                                                          .grayColor),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            24,
                                                                        vertical:
                                                                            20),
                                                                child: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .shape,
                                                                  style: textStyle(
                                                                      color: AppColors
                                                                          .grayColor,
                                                                      fontSize:
                                                                          20.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                )),
                                                            SizedBox(height: 23),
                                                            StreamBuilder(
                                                              builder: (context,
                                                                  snapshot) {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      MedicineTypeColumn(
                                                                          iconValue:
                                                                              AppAssets
                                                                                  .medicine1,
                                                                          isSelected: snapshot.data == MedicineType.bottle
                                                                              ? true
                                                                              : false,
                                                                          medicineType:
                                                                              MedicineType.bottle),
                                                                      MedicineTypeColumn(
                                                                          iconValue:
                                                                              AppAssets
                                                                                  .medicine2,
                                                                          isSelected: snapshot.data == MedicineType.pill
                                                                              ? true
                                                                              : false,
                                                                          medicineType:
                                                                              MedicineType.pill),
                                                                      MedicineTypeColumn(
                                                                          iconValue:
                                                                              AppAssets
                                                                                  .medicine3,
                                                                          isSelected: snapshot.data == MedicineType.syringe
                                                                              ? true
                                                                              : false,
                                                                          medicineType:
                                                                              MedicineType.syringe),
                                                                      MedicineTypeColumn(
                                                                          iconValue:
                                                                              AppAssets
                                                                                  .medicine4,
                                                                          isSelected: snapshot.data == MedicineType.tablet
                                                                              ? true
                                                                              : false,
                                                                          medicineType:
                                                                              MedicineType.tablet),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                              stream: null,
                                                            )
                                                          ],
                                                        ),
                                                      ),

                                                      // Positioned(
                                                      //   left: 89.h,
                                                      //   top: 400.h,
                                                      //   child: Container(
                                                      //     padding:
                                                      //         const EdgeInsets
                                                      //             .symmetric(
                                                      //             horizontal: 29,
                                                      //             vertical: 12),
                                                      //     clipBehavior:
                                                      //         Clip.antiAlias,
                                                      //     decoration:
                                                      //         ShapeDecoration(
                                                      //       gradient:
                                                      //           LinearGradient(
                                                      //         begin: Alignment(
                                                      //             0.00, -1.00),
                                                      //         end:
                                                      //             Alignment(0, 1),
                                                      //         colors: [
                                                      //           AppColors
                                                      //               .lightPrimaryColor,
                                                      //           AppColors
                                                      //               .primaryColor
                                                      //         ],
                                                      //       ),
                                                      //       shape:
                                                      //           RoundedRectangleBorder(
                                                      //         borderRadius:
                                                      //             BorderRadius
                                                      //                 .circular(
                                                      //                     20.r),
                                                      //       ),
                                                      //     ),
                                                      //     child: Row(
                                                      //       mainAxisSize:
                                                      //           MainAxisSize.min,
                                                      //       mainAxisAlignment:
                                                      //           MainAxisAlignment
                                                      //               .center,
                                                      //       crossAxisAlignment:
                                                      //           CrossAxisAlignment
                                                      //               .center,
                                                      //       children: [
                                                      //         Text(
                                                      //           AppLocalizations.of(
                                                      //                   context)!
                                                      //               .addMedicine,
                                                      //           textAlign:
                                                      //               TextAlign
                                                      //                   .center,
                                                      //           style: TextStyle(
                                                      //             color: AppColors
                                                      //                 .redColor,
                                                      //             fontSize: 20.sp,
                                                      //             fontFamily:
                                                      //                 'Kodchasan',
                                                      //             fontWeight:
                                                      //                 FontWeight
                                                      //                     .w600,
                                                      //             height: 0,
                                                      //           ),
                                                      //         ),
                                                      //       ],
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      //
                                                      //


                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                ]),
          ),
        ));
  }

//     Widget _buildIcons(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.all(10),
//         height: 70,
//         width: 70,
//         decoration: BoxDecoration(
//           color: (index == _selectedIndex)
//               ? AppColors.primaryColor
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(40),
//         ),
//         child: Image.asset( _icons[index]),
//       ),
//     );
//   }
}

class MedicineTypeColumn extends StatefulWidget {
  const MedicineTypeColumn(
      {Key? key,
      required this.iconValue,
      required this.isSelected,
      required this.medicineType})
      : super(key: key);
  final String iconValue;
  final bool isSelected;
  final MedicineType medicineType;

  @override
  State<MedicineTypeColumn> createState() => _MedicineTypeColumnState();
}

class _MedicineTypeColumnState extends State<MedicineTypeColumn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // _selectedIndex = index;
        });
      },
      child: Container(
        width: 48.w,
        height: 48.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 3.r,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: widget.isSelected
                    ? AppColors.primaryColor
                    : AppColors.lightGrayColor),
            borderRadius: BorderRadius.circular(38.r),
          ),
        ),
        child: Image.asset(
          widget.iconValue,
          scale: 0.5,
        ),
      ),
    );
  }
}
