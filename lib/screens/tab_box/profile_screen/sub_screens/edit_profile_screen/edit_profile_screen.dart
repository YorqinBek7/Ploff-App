import 'package:flutter/material.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/widgets/profile_subscreen_appbar.dart';
import 'package:ploff/screens/tab_box/widgets/auth_button.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/edit_profile_screen/widgets/edit_fields.dart';
import 'package:ploff/utils/colors/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController controller = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  final TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    numberController.text =
        sharedPreferences!.getString("numberPhone").toString();
    controller.text = "Yorqin";
    dateController.text = "30.03.2003";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: Text('Edit profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: PloffColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name"),
                  EditFields(
                    controller: controller,
                    isDisable: true,
                  ),
                  const Text("Phone number"),
                  EditFields(
                    controller: numberController,
                    isDisable: false,
                  ),
                  const Text("Date of birth"),
                  EditFields(
                    controller: dateController,
                    isDisable: false,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GlobalButton(
                buttonText: "Confirm",
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
