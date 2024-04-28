import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 85),
           Text(
            AppLocalizations.of(context)!.detectAnemia,
            style: const TextStyle(
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

 