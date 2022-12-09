import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Pinput(
          length: 6,
        ),
      ],
    );
  }
}
