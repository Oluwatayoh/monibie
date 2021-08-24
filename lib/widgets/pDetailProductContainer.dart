import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final double? width;
  final VoidCallback? onTap;
  final Widget? content;
  final Color? borderColor;

  const ProductContainer({
    Key? key,
    this.width,
    this.onTap,
    this.content,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width == null ? MediaQuery.of(context).size.width / 4 : width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor!, width: 2.0),
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10.0,
              )),
          child: content,
        ));
  }
}
