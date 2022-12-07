import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen/widgets/check_item.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen/widgets/payment_select.dart';
import 'package:ploff/screens/tab_box/widgets/auth_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class SecondPage extends StatelessWidget {
  final ValueChanged paymentValueChanged;
  Object? paymentType;
  SecondPage({
    super.key,
    required this.paymentType,
    required this.paymentValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
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
                              const GoogleMap(
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
                                    onPressed: () {},
                                    icon: SvgPicture.asset(Plofficons.big)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(Plofficons.restaurant),
                        title: Text("Samarqand Darvoza"),
                        subtitle: Text("SSS, Tshkent"),
                        trailing: Icon(Icons.circle_outlined),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(Plofficons.restaurant),
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
                  valueChanged: paymentValueChanged,
                  paymentType: paymentType,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: PloffColors.white,
                  ),
                  child: Column(
                    children: const [
                      CheckItem(
                        item: "String",
                        price: "2300",
                      ),
                      CheckItem(
                        item: "String",
                        price: "2300",
                      ),
                      CheckItem(
                        item: "String",
                        price: "2300",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: PloffColors.white),
          child: GlobalButton(
            buttonText: "Order",
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
