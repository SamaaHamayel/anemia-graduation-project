
  import 'package:flutter/material.dart';

IconButton buildIconButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
        size: icon == Icons.circle_outlined ? 60.0 : 30.0,
      ),
      onPressed: onPressed,
    );
  }
