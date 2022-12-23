import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/widgets/check_item.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/widgets/payment_select.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/widgets/select_options.dart';
import 'package:ploff/utils/enum_classes/enum_classes.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/get_location_screen/widgets/mini_text_fields.dart';
import 'package:ploff/screens/tab_box/widgets/address_text_fields.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class FirstPage extends StatelessWidget {
  final TextEditingController entranceController;

  final TextEditingController floorController;

  final TextEditingController flatController;
  final TextEditingController addressController;

  PaymentType? paymentType = PaymentType.Cash;
  DeliveryMethod? deliveryMethod = DeliveryMethod.Express;
  CourierCall? courierCall = CourierCall.Yes;
  bool isEnabled = false;
  final ValueChanged courierValueChanged;
  final ValueChanged deliverValueChanged;
  final ValueChanged paymenValueChanged;

  FirstPage({
    super.key,
    required this.entranceController,
    required this.floorController,
    required this.flatController,
    required this.courierValueChanged,
    required this.courierCall,
    required this.deliveryMethod,
    required this.paymentType,
    required this.deliverValueChanged,
    required this.isEnabled,
    required this.paymenValueChanged,
    required this.addressController,
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
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: PloffColors.white,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Адрес доставки",
                        style: PloffTextStyle.w600.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Текущий адрес",
                        style: PloffTextStyle.w400.copyWith(
                          fontSize: 15,
                          color: PloffColors.black.withOpacity(.5),
                        ),
                      ),
                      AddressTextFields(
                        isEnabled: true,
                        addressController: addressController,
                      ),
                      Row(
                        children: [
                          MiniTextaFields(
                            hintText: "Podezd",
                            controller: entranceController,
                          ),
                          MiniTextaFields(
                            hintText: "Etaj",
                            controller: floorController,
                          ),
                          MiniTextaFields(
                            hintText: "Kvartira",
                            controller: flatController,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              const GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(69, 41),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SvgPicture.asset(
                                  Plofficons.big,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "My address",
                        style: PloffTextStyle.w400.copyWith(fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: AddressTextFields(
                          isEnabled: false,
                          addressController: addressController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: PloffColors.white,
                  ),
                  child: SelectOptions(
                    firstOnTap: courierValueChanged,
                    secondOnTap: courierValueChanged,
                    firstGroupValue: courierCall,
                    firstValue: CourierCall.Yes,
                    secondGroupValue: courierCall,
                    secondValue: CourierCall.No,
                    firstSelect: 'Да',
                    secondSelect: 'Нет',
                    title: 'Хотели бы что бы вам позвонил курьер?',
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: PloffColors.white,
                  ),
                  child: SelectOptions(
                    firstOnTap: deliverValueChanged,
                    secondOnTap: deliverValueChanged,
                    firstGroupValue: deliveryMethod,
                    firstValue: DeliveryMethod.Express,
                    secondGroupValue: deliveryMethod,
                    secondValue: DeliveryMethod.Scheduled,
                    firstSelect: 'Срочная доставка',
                    secondSelect: 'Доставка по расписанию',
                    title: 'Время доставка',
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: TypePayment(
                valueChanged: paymenValueChanged,
                paymentType: paymentType,
              )),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: PloffColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Check",
                        style: PloffTextStyle.w600.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ...List.generate(
                        5,
                        (index) => Column(
                          children: const [
                            CheckItem(
                              item: 'Хотели бы что бы вам позвонил курьер?',
                              price: '2300',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              "Общая сумма",
                              style: PloffTextStyle.w600.copyWith(
                                color: PloffColors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "95000",
                              style: PloffTextStyle.w600.copyWith(
                                color: PloffColors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
