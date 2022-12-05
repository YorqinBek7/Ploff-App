import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class ProfileOptionsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const ProfileOptionsItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: PloffColors.white,
      onTap: onTap,
      leading: Icon(
        icon,
        color: PloffColors.black,
      ),
      title: Text(
        title,
        style: PloffTextStyle.w500.copyWith(fontSize: 16),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
