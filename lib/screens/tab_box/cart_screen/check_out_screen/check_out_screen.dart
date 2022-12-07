import 'package:flutter/material.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen/widgets/check_out_bottom_bar.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen/widgets/enum_classes/enum_classes.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen/widgets/first_screen.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'check_out_screen/widgets/second_screen.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final TextEditingController podezd = TextEditingController();

  final TextEditingController etaj = TextEditingController();

  final TextEditingController kvartira = TextEditingController();

  PaymentType? _paymentType = PaymentType.Cash;
  DeliveryMethod? _deliveryMethod = DeliveryMethod.Express;
  CourierCall? _courierCall = CourierCall.Yes;
  PageController controller = PageController();
  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: const Text("CheckOut order"),
        bottom: CheckOutBottomBar(
          isDeliver: isEnabled,
          onTap: () {
            setState(() {
              isEnabled = !isEnabled;
            });
            if (isEnabled) {
              controller.jumpToPage(0);
            } else {
              controller.jumpToPage(1);
            }
          },
        ),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          FirstPage(
            podezd: podezd,
            etaj: etaj,
            kvartira: kvartira,
            courierCall: _courierCall,
            deliveryMethod: _deliveryMethod,
            paymentType: _paymentType,
            courierValueChanged: (value) {
              setState(
                () {
                  _courierCall = value;
                },
              );
            },
            deliverValueChanged: (value) {
              _deliveryMethod = value;
              setState(() {});
            },
            isEnabled: true,
            paymenValueChanged: (value) {
              _paymentType = value;
              setState(() {});
            },
          ),
          SecondPage(
            paymentType: _paymentType,
            paymentValueChanged: (value) => {
              _paymentType = value,
              setState(
                () => {},
              ),
            },
          )
        ],
      ),
    );
  }
}
