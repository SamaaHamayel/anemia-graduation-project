// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../core/utils/appColors/app_colors.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';


// class TestHistoryCard extends StatelessWidget {
//   const TestHistoryCard({
//     super.key,
//     required this.datetime,
//   });

//   final String datetime;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 353.h,
//       width: 343.w,
//       decoration: BoxDecoration(
//           border: Border.all(
//               color: AppColors.primaryColor
//           ),
//           borderRadius: BorderRadius.circular(16.r)
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: Text(datetime),
//               ),
//               Spacer(),
//               IconButton(
//                   onPressed: (){},
//                   icon: Icon(Icons.delete_sharp)),
//             ],
//           ),
//           SizedBox(
//             height: 160.h,
//             width: 151.w,
//             child: Image.asset("lib/core/utils/appImages/images/eyelid 1.png"),
//           ),

//           SizedBox(
//             height: 20.h,
//           ),
//           //get its logic  from api or ai i don't know
//           Text(AppLocalizations.of(context)!.youAreAnemic,
//             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//               fontSize: 20,
//               fontFamily: "Kodchasan",
//               fontWeight: FontWeight.w600,
//             ),),
//           SizedBox(
//             height: 20.h,
//           ),
//           Text(AppLocalizations.of(context)!.theTypeOfAnemiaYouHaveIs,
//             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//               fontSize: 18,
//               fontFamily: "Kodchasan",
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           // until this above text

//         ],
//       ),
//     );
//   }
// }
