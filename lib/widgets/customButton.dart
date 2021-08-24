import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final VoidCallback? onTap;
  final Widget? content;
  final Color? color;
  final Color? borderColor;

  const CustomButton(
      {Key? key,
      this.width,
      this.onTap,
      this.content,
      this.borderColor,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width == null ? double.infinity : width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor!, width: 2.0),
              color: color,
              borderRadius: BorderRadius.circular(
                50.0,
              )),
          child: content,
        ));
  }
}
