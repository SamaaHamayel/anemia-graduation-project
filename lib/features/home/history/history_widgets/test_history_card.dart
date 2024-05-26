import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/appColors/app_colors.dart';

import '../data/history_model.dart';

class TestHistoryCard extends StatefulWidget {
  const TestHistoryCard({
    super.key,
    required this.historyModel,
  });

  final HistoryModel historyModel;

  @override
  State<TestHistoryCard> createState() => _TestHistoryCardState();
}

class _TestHistoryCardState extends State<TestHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: 343.w,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.historyModel.date,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontFamily: "Kodchasan",
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                const Spacer(),


                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(widget.historyModel.result.contains('Not-Anemic')?
                    Icons.health_and_safety_outlined:Icons.biotech,
                      color: widget.historyModel.result.contains('Not-Anemic')
                          ? AppColors.greenColor
                          : AppColors.redColor,
                      size: 28,
                    ),
                  )
                  // Icon(widget.historyModel.result.contains('Not-Anemic')),



                // IconButton(
                //   onPressed: () {
                //     HistoryModel.historyList.remove(widget.historyModel.id);
                //     setState(() {
                //
                //     });
                //   },
                //   icon: const Icon(
                //     Icons.delete_outline_rounded,
                //     color: AppColors.redColor,
                //     size: 28,
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "Your Are :",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 20,
                  fontFamily: "Kodchasan",
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            widget.historyModel.result,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 20,
                  color: widget.historyModel.result.contains('Not-Anemic')
                      ? AppColors.greenColor
                      : AppColors.redColor,
                  fontFamily: "Kodchasan",
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
