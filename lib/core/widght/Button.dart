import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    required this.height,
    required this.width,
    this.backGroundcolor = Colors.transparent,
    required this.titleStyle,
    this.bordersColor = Colors.transparent,
    this.onTap,
  });

  final String title;
  final double height;
  final double width;
  final Color backGroundcolor;

  final Color bordersColor;
  final void Function()? onTap;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: bordersColor),
          borderRadius: BorderRadius.circular(12),
          color: backGroundcolor,
          // color: ColorManger.primaryGreen
        ),
        child: Center(
            child: FittedBox(
          child: Text(
            title,
            style: titleStyle,
          ),
        )),
      ),
    );
  }
}
