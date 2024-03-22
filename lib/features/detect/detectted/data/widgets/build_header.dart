
  import 'package:flutter/material.dart';

Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 85),
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
          ),
        ],
      ),
    );
  }

 