import 'package:flutter/material.dart';

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
    return historyList.isEmpty
        ?const NoHistoryWidget()
        : ListView.builder(
            itemCount: historyList.length,
            itemBuilder: (BuildContext context, int index) {
              return Item(historyModel: historyList[index]);
            },
          );
  }
}

class Item extends StatelessWidget {
  final HistoryModel historyModel;
  const Item({super.key, required this.historyModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${historyModel.id}'),
        Text('${historyModel.result}'),
        Text('${historyModel.date}'),
      ],
    );
  }
}
