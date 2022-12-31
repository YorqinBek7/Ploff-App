import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff/cubits/empty_cart/empty_cart_cubit.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/models/orders/orders.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/widgets/first_screen.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/widgets/second_screen.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/utils/enum_classes/enum_classes.dart';
import 'package:ploff/screens/tab_box/widgets/custom_tab_bar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/helper/helper.dart';
import 'package:ploff/utils/style/text_style.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController podezd = TextEditingController();

  final TextEditingController etaj = TextEditingController();

  final TextEditingController kvartira = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  PaymentType? _paymentType = PaymentType.Cash;
  DeliveryMethod? _deliveryMethod = DeliveryMethod.Express;
  CourierCall? _courierCall = CourierCall.Yes;
  PageController controller = PageController();
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
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                FirstPage(
                  entranceController: podezd,
                  floorController: etaj,
                  flatController: kvartira,
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
                  addressController: addressController,
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
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PloffColors.white),
            child: GlobalButton(
              buttonText: "Order",
              onTap: () async {
                List<CategWithProduct> prod = [];
                for (var i = 0;
                    i < HiveService.instance.cartProductsBox.length;
                    i++) {
                  prod.add(HiveService.instance.cartProductsBox.getAt(i)!);
                }
                HiveService.instance.orderProductsBox.add(
                  Orders(
                    orderedProducts: prod,
                    address: addressController.text,
                    date: DateFormat.yMd().format(DateTime.now()),
                    paymentType: _paymentType.toString(),
                    time: DateFormat.Hm().format(DateTime.now()),
                  ),
                );
                context.read<EmptyCartCubit>().empty();
                Helper.showSuccesSnackBar(
                    "Buyurtmangiz qabul qilindi!", context);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
