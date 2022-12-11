import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';

class CheckOutBottomBar extends StatelessWidget implements PreferredSize {
  bool isDeliver;
  final VoidCallback onTap;
  CheckOutBottomBar({
    required this.onTap,
    required this.isDeliver,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: PloffColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: PloffColors.C_F0F0F0,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: SelectTypeOrderButton(
                onTap: onTap,
                textButton: 'Deliver',
                isDeliver: !isDeliver,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: SelectTypeOrderButton(
                onTap: onTap,
                textButton: 'Deliver',
                isDeliver: isDeliver,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 40);
}

class SelectTypeOrderButton extends StatelessWidget {
  final bool isDeliver;
  final String textButton;
  final VoidCallback onTap;
  const SelectTypeOrderButton({
    Key? key,
    required this.textButton,
    required this.onTap,
    required this.isDeliver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isDeliver ? PloffColors.white : PloffColors.C_F0F0F0,
        ),
        child: Center(
          child: Text(textButton),
        ),
      ),
    );
  }
}
