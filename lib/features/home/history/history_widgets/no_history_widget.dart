import 'package:flutter/material.dart';

class NoHistoryWidget extends StatelessWidget {
  const NoHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 80,
            color: Colors.grey,
          ),
          SizedBox(height: 20),
          Text(
            'No history available',
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
