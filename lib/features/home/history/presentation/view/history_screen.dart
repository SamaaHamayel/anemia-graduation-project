import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/history/history_widgets/test_history_card.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/history_model.dart';
import '../../history_widgets/no_history_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<HistoryModel> historyList = [];
  @override
  void initState() {
    HistoryService.loadHistoryList().then((value) {
      setState(() {
        historyList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
              ? (AppAssets.backgroundDark)
              : (AppAssets.background),
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        historyList.isEmpty
            ? const NoHistoryWidget()
            : ListView.builder(
                itemCount: historyList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TestHistoryCard(
                      historyModel: historyList[index],
                    ),
                  );
                },
              ),
      ],
    );
  }
}
