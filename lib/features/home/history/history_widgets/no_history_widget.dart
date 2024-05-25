import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoHistoryWidget extends StatelessWidget {
  const NoHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      const    Icon(
            Icons.history,
            size: 80,
            color: Colors.grey,
          ),
      const    SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.noHistory,
            style:const TextStyle(
              fontSize: 24,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
