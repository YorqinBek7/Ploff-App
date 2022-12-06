import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ploff/utils/colors/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PloffColors.white,
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Condensation policy"),
                    trailing: Icon(Icons.arrow_right_outlined),
                    onTap: () {},
                    onLongPress: () {},
                  ),
                  const Divider(),
                  ListTile(
                    title: Text("License agreements"),
                    trailing: Icon(Icons.arrow_right_outlined),
                    onTap: () {},
                    onLongPress: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
