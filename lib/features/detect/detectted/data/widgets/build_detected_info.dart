import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';



Widget buildDetectedInfo(context) {
    return Padding(
      padding:  const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Padding(
            padding:  const EdgeInsets.only(bottom: 30.0),
            child: Image.asset(
              'lib/core/utils/appImages/images/detect.png',
              scale: 1,
            ),
          ),
           const SizedBox(height: 30),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: 333,
              child: Text(
                AppLocalizations.of(context)!.detectAnemiaTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

