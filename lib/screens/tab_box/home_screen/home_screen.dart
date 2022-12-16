// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ploff/cubits/get_product_categ_bann/get_product_and_category_cubit.dart';
import 'package:ploff/data/models/products/products.dart';
import 'package:ploff/data/service/get_location.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/get_location_screen/get_location_screen.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/meal_detail_screen/meal_detail_screen.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/banner_widget.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/category.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/meal_item.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/search_field.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Placemark> placemark;
  late Position position;
  List<Product> product = [];
  final TextEditingController textEditingController = TextEditingController();
  var length = 0;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await context.read<GetProductAndCategoryCubit>().getProductAndCateg();
  }

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
                SearchField(
                    textEditingController: textEditingController,
                    onChanged: (value) async {
                      if (value.length > 2) {
                        if (length < value.length) {
                          await context
                              .read<GetProductAndCategoryCubit>()
                              .getProductAndCateg(searchText: value);
                          setState(() {});
                        }
                        length = value.length;
                      }
                      if (value.length == 0) {
                        await context
                            .read<GetProductAndCategoryCubit>()
                            .getProductAndCateg();
                        setState(() {});
                      }
                    }),
                SizedBox(height: 5),
              ],
            ),
          ),
          BlocBuilder<GetProductAndCategoryCubit, GetProductAndCategoryState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == FormzStatus.submissionFailure) {
                return Center(
                  child: Text(state.errorText),
                );
              } else if (state.states == HomeScreenStates.searchState &&
                  state.status == FormzStatus.submissionSuccess) {
                return Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: PloffColors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                Plofficons.meal,
                                width: 80,
                                height: 80,
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Text(state
                                      .products[index].measurement.short_name
                                      .toString())),
                              Expanded(
                                  child: Text(state.products[index].out_price
                                      .toString()))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state.states == HomeScreenStates.initialState &&
                  FormzStatus.submissionSuccess == state.status) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await init();
                    },
                    child: CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: CategoryItem(
                            categorie: state.categories,
                            setter: (fn) => {
                              setState(
                                () => {},
                              ),
                            },
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(height: 15),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15),
                            height: 170,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.banners.length,
                              itemBuilder: (context, index) => BannerWidget(
                                imagePath: state.banners[index].image,
                              ),
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              ...List.generate(state.categories.length,
                                  (categoryIndex) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    color: PloffColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 16),
                                        child: Text(
                                          state.categories[categoryIndex].title
                                              .uz,
                                          style: PloffTextStyle.w600
                                              .copyWith(fontSize: 22),
                                        ),
                                      ),
                                      ...List.generate(
                                        state.products.length,
                                        (index) {
                                          return MealItem(
                                            mealDescription: state
                                                .products[index].description.uz,
                                            mealName: state.products[index]
                                                .measurement.short_name
                                                .toString(),
                                            mealPrice: state
                                                .products[index].out_price
                                                .toString(),
                                            index: index,
                                            length: state.products.length,
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                  builder: (context) =>
                                                      MealDetailScreen(
                                                    aboutMeal:
                                                        state.products[index],
                                                    price: double.parse(state
                                                        .products[index]
                                                        .out_price
                                                        .toString()),
                                                    firstlyPrice: double.parse(
                                                      state.products[index]
                                                          .out_price
                                                          .toString(),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
