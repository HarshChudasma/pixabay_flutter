import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Svg picture components for projects

class SvgIconComponent extends StatelessWidget {
  final String icon;
  final double height;
  final double width;
  final Color? color;

  const SvgIconComponent({
    Key? key,
    required this.icon,
    this.height = 24,
    this.width = 24,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      fit: BoxFit.cover,
      icon,
      height: height,
      width: width,
      colorFilter:
      color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
