import 'package:flutter/widgets.dart';

class OnboardingModel {
  final String title;
  final String subtitle;
  final String image;
  final String counterText;
  final Color bgColor;
  final double height;

  OnboardingModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.counterText,
    required this.bgColor,
    required this.height
  });
}
