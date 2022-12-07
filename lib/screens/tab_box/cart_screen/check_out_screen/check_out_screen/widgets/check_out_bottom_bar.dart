import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckOutBottomBar extends StatelessWidget implements PreferredSize {
  const CheckOutBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 40);
}
