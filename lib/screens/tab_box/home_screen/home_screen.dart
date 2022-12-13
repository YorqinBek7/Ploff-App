// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ploff/data/service/get_location.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/get_location_screen/get_location_screen.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/meal_detail_screen/meal_detail_screen.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/banner_widget.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/category.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/meal_item.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/search_field.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/enum_classes/enum_classes.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

List<int> categoryIndex = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Placemark> placemark;
  late Position position;
  List allMeals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            color: PloffColors.white,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    position = await getCurrentLocation();
                    placemark = await placemarkFromCoordinates(
                      position.latitude,
                      position.longitude,
                    );
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => GetLocationScreen(
                          position: position,
                          placemark: placemark,
                        ),
                      ),
                    );
                    // showModalBottomSheet(
                    //   context: context,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(10),
                    //       topRight: Radius.circular(10),
                    //     ),
                    //   ),
                    //   builder: (context) => Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Center(
                    //         child: Text(
                    //           "Мои адреса",
                    //           style: PloffTextStyle.w600
                    //               .copyWith(fontSize: 20),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: ListView(
                    //           physics: BouncingScrollPhysics(),
                    //           shrinkWrap: true,
                    //           children: [
                    //             ...List.generate(
                    //               5,
                    //                   (index) => RadioListTile(
                    //                 subtitle: Text("qwerty"),
                    //                 value: numbers[index],
                    //                 title: Text("Qwerty"),
                    //                 groupValue: _address,
                    //                 onChanged: (value) {
                    //                   setState(
                    //                         () => {
                    //                       _address = value,
                    //                     },
                    //                   );
                    //                 },
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.all(16),
                    //         child: GlobalButton(
                    //           buttonText: "Add address",
                    //           onTap: () {
                    //             Navigator.push(
                    //               context,
                    //               CupertinoPageRoute(
                    //                 builder: (context) => GetLocationScreen(
                    //                   position: position,
                    //                   placemark: placemark,
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // );
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(Plofficons.location),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          "Массив Бешягач 19/30",
                          style: PloffTextStyle.w400.copyWith(fontSize: 15),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Image.asset(
                        Plofficons.arrowDown,
                        width: 16,
                        height: 16,
                      ),
                      Spacer()
                    ],
                  ),
                ),
                SizedBox(height: 12),
                SearchField(),
                SizedBox(height: 16),
                CategoryItem(
                  setter: (fn) => {
                    setState(() => {}),
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      height: 170,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => BannerWidget(),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 5,
                      (context, index) => Container(
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: PloffColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Text(
                                "Birinchi taomlar",
                                style:
                                    PloffTextStyle.w600.copyWith(fontSize: 22),
                              ),
                            ),
                            ...List.generate(
                              allMeals.length,
                              (index) => MealItem(
                                mealDescription:
                                    allMeals[index].mealDescription,
                                mealName: allMeals[index].mealName,
                                mealPrice: allMeals[index].priceMeal.toString(),
                                index: index,
                                length: allMeals.length,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => MealDetailScreen(
                                        aboutMeal: allMeals[index],
                                        price: allMeals[index].priceMeal,
                                        firstlyPrice: allMeals[index].priceMeal,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
