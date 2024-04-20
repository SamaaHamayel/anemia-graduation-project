import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Kumbh Sans',
      ),
      textAlign: textAlign,
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final Color borderColor;

  const CustomContainer({
    Key? key,
    required this.child,
    this.width = 343,
    this.height = 88,
    this.padding = const EdgeInsets.symmetric(vertical: 20),
    this.shape = const RoundedRectangleBorder(),
    this.borderColor = const Color(0xFF2BB598),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: shape,
      ),
      child: child,
    );
  }
}

class ExpandLessIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.expand_more,
          size: 16,
          color: Colors.black,
        ),
        SizedBox(height: 8),
        Icon(
          Icons.expand_less,
          size: 16,
          color: Colors.black,
        ),
      ],
    );
  }
}

Widget buildInstructionText(String instruction) {
  return CustomText(
    text: instruction,
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}

Widget buildContainerWithHB(String labelText) {
  return CustomContainer(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: labelText,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color(0xFF2BB598),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              CustomText(
                text: 'Less',
                color: Color(0xFF2BB598),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(width: 44),
              ExpandLessIcon(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        SizedBox(
          width: 347,
          child: buildInstructionText(
            'If the result is “lower than” the minimum number in the range (13.5), choose "less" by clicking on the arrow below.',
          ),
        ),
        SizedBox(height: 20),
        buildContainerWithHB('HB:'),
        SizedBox(height: 20),
        SizedBox(
          width: 347,
          child: buildInstructionText(
            'If the result is “higher than” the maximum number in the range(17.5), choose "greater" by clicking on the arrow above.',
          ),
        ),
        SizedBox(height: 20),
        buildContainerWithHB('HB:'),
        SizedBox(height: 20),
        SizedBox(
          width: 347,
          child: buildInstructionText(
            'If the result is “between” the minimum and maximum values of the range, it will be "normal".',
          ),
        ),
        SizedBox(height: 20),
        CustomContainer(
          child: buildContainerWithHB('HB:'),
          borderColor: Colors.green,
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}
