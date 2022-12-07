import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen/widgets/check_out_bottom_bar.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen/widgets/enum_classes/enum_classes.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen/widgets/first_screen.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen/widgets/payment_select.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

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
        bottom: CheckOutBottomBar(),
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
          Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: PloffColors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ближайший филиал",
                              style: PloffTextStyle.w500.copyWith(fontSize: 18),
                            ),
                            SizedBox(
                              height: 156,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  children: [
                                    GoogleMap(
                                      mapType: MapType.hybrid,
                                      initialCameraPosition: CameraPosition(
                                        target: LatLng(
                                          61,
                                          49,
                                        ),
                                        zoom: 20,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: IconButton(
                                        onPressed: () => {},
                                        icon: Icon(
                                          Icons
                                              .keyboard_double_arrow_down_sharp,
                                          color: PloffColors.white,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.icecream_outlined,
                              ),
                              title: Text("Samarqand Darvoza"),
                              subtitle: Text("SSS, Tshkent"),
                              trailing: Icon(Icons.circle_outlined),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.icecream_outlined,
                              ),
                              title: Text("Toshkent"),
                              subtitle: Text("SSS, Tshkent"),
                              trailing: Icon(Icons.circle_outlined),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: TypePayment(
                        valueChanged: (value) => {
                          _paymentType = value,
                          setState(
                            () => {},
                          ),
                        },
                        paymentType: _paymentType,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
