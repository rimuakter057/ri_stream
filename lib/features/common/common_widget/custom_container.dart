import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;

  const CustomContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
    this.padding,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        border: border,
      ),
      child: child,
    );
  }
}
