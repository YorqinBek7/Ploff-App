import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';

class BannerWidget extends StatelessWidget {
  final String imagePath;
  const BannerWidget({
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: PloffColors.white,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: PloffColors.C_F0F0F0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imagePath,
            width: 148,
            height: 152,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
