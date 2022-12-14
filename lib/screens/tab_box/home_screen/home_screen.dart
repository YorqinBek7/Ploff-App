// ignore_for_file: prefer_const_constructors
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ploff/cubits/change_language/change_language_cubit.dart';
import 'package:ploff/cubits/current_loc/current_location_cubit.dart';
import 'package:ploff/cubits/get_product_categ_bann/get_product_and_category_cubit.dart';
import 'package:ploff/cubits/modifiers/modifiers_cubit.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/banner_widget.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/category.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/choose_language.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/meal_item.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/search_field.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/search_state_ui.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
import 'package:ploff/utils/helper/helper.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Placemark>? placemark;
  Position? position;
  final TextEditingController searchController = TextEditingController();
  int length = 0;
  bool isTapped = false;
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await context.read<GetProductAndCategoryCubit>().getProductAndCateg();
  }

  Helper helper = Helper();
  @override
  Widget build(BuildContext context) {
    var getProdCateg = context.read<GetProductAndCategoryCubit>();
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
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
                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await helper.getLocation();
                        HiveService.instance.userLocations.isEmpty
                            ? Navigator.pushNamed(
                                context, Constants.getLocationScreen)
                            : await chooseLocation(context);
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.0.w,
                          ),
                          SvgPicture.asset(Plofficons.location),
                          SizedBox(
                            width: 5.0.w,
                          ),
                          HiveService.instance.userLocations.isNotEmpty
                              ? BlocBuilder<CurrentLocationCubit,
                                  CurrentLocationState>(
                                  builder: (context, state) {
                                    return Text(
                                      state.locationName,
                                      style: PloffTextStyle.w400
                                          .copyWith(fontSize: 15.0.sp),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    );
                                  },
                                )
                              : Text(
                                  tr("add_location"),
                                  style: PloffTextStyle.w400
                                      .copyWith(fontSize: 15.0.sp),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          Image.asset(
                            Plofficons.arrowDown,
                            width: 16.0.w,
                            height: 16.0.h,
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SearchField(
                        textEditingController: searchController,
                        onChanged: (value) async {
                          if (value.length > 2) {
                            if (length < value.length) {
                              await getProdCateg.getProductAndCateg(
                                searchText: value,
                              );
                            }
                            length = value.length;
                          }
                          if (value.length == 0) {
                            await getProdCateg.getProductAndCateg();
                          }
                        }),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
              BlocBuilder<GetProductAndCategoryCubit,
                  GetProductAndCategoryState>(
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
                    return SearchStateUi(
                      state: state,
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
                                setter: (fn) => {
                                  setState(
                                    () => {
                                      isTapped = !isTapped,
                                    },
                                  ),
                                },
                                category: state.products,
                                state: state,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: SizedBox(height: 15.0.h),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 15.0.h),
                                height: 170.0.h,
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
                                  ...List.generate(
                                    getProdCateg.products2.isEmpty
                                        ? state.products.length
                                        : getProdCateg.products2.length,
                                    (categoryIndex) {
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 12.h),
                                        decoration: BoxDecoration(
                                          color: PloffColors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0.r),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 16.w),
                                              child: Text(
                                                getProdCateg.products2.isEmpty
                                                    ? state
                                                        .products[categoryIndex]
                                                        .title1
                                                        .uz
                                                    : getProdCateg
                                                        .products2[
                                                            categoryIndex]
                                                        .title1
                                                        .uz,
                                                style: PloffTextStyle.w600
                                                    .copyWith(
                                                        fontSize: 22.0.sp),
                                              ),
                                            ),
                                            ...List.generate(
                                              getProdCateg.products2.isEmpty
                                                  ? state
                                                      .products[categoryIndex]
                                                      .products
                                                      .length
                                                  : getProdCateg
                                                      .products2[categoryIndex]
                                                      .products
                                                      .length,
                                              (index) {
                                                var product = getProdCateg
                                                        .products2.isEmpty
                                                    ? state.products
                                                    : context
                                                        .read<
                                                            GetProductAndCategoryCubit>()
                                                        .products2;
                                                return MealItem(
                                                  product:
                                                      product[categoryIndex]
                                                          .products[index],
                                                  index: index,
                                                  length: product[categoryIndex]
                                                      .products
                                                      .length,
                                                  onTap: () {
                                                    context
                                                        .read<ModifiersCubit>()
                                                        .getModifiers();
                                                    Navigator.pushNamed(
                                                      context,
                                                      Constants
                                                          .mealDetailScreen,
                                                      arguments:
                                                          product[categoryIndex]
                                                              .products[index],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
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
      },
    );
  }
}
