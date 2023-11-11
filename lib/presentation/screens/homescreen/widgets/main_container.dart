import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer(
      {super.key,
      this.color,
      this.child,
      this.height,
      this.width,
      this.margin,
      this.padding});
  final Color? color;
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      child: child,
    );
  }
}
