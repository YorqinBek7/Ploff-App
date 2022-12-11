import 'package:flutter/material.dart';
import 'package:ploff/screens/tab_box/home_tab/cart_screen/check_out_screen/widgets/first_screen.dart';
import 'package:ploff/screens/tab_box/home_tab/cart_screen/check_out_screen/widgets/second_screen.dart';
import 'package:ploff/utils/enum_classes/enum_classes.dart';
import 'package:ploff/screens/tab_box/widgets/custom_tab_bar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController entranceController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController flatController = TextEditingController();
  PaymentType? _paymentType = PaymentType.Cash;
  DeliveryMethod? _deliveryMethod = DeliveryMethod.Express;
  CourierCall? _courierCall = CourierCall.Yes;
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: Text(
          "Оформить заказ",
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
        ),
        bottom: CustomTabBar(
          tabController: tabController,
          firstTabText: 'Order',
          secondTabText: 'Self order',
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          FirstPage(
            entrance: entranceController,
            floor: floorController,
            flat: flatController,
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
          ),
        ],
      ),
    );
  }
}
