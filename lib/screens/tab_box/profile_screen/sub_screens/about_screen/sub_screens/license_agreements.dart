import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/widgets/profile_subscreen_appbar.dart';

class LicenceScreen extends StatelessWidget {
  const LicenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Licence agreements"),
    ));
  }
}
