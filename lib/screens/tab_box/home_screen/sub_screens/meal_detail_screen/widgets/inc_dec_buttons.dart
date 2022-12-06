import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IncDecButtons extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;

  const IncDecButtons({
    Key? key,
    required this.onTap,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SvgPicture.asset(
          imagePath,
        ),
      ),
    );
  }
}
