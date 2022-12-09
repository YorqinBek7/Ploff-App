import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/data/local_database/cached_meals.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class CartsItem extends StatefulWidget {
  CartsItem({
    Key? key,
    required this.meals,
    required this.count,
  }) : super(key: key);

  List<CachedMeals> meals;
  int count;

  @override
  State<CartsItem> createState() => _CartsItemState();
}

class _CartsItemState extends State<CartsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: PloffColors.white,
        border: Border(
          bottom: BorderSide(
            color: PloffColors.black.withOpacity(.1),
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                Plofficons.meal,
                width: 88,
                height: 88,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.meals[0].mealName,
                    style: PloffTextStyle.w600.copyWith(fontSize: 17),
                  ),
                  SizedBox(height: 25),
                  Text(
                    widget.meals[0].mealDescription,
                    style: PloffTextStyle.w500.copyWith(fontSize: 15),
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: SvgPicture.asset(Plofficons.cancel),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => {
                          if (widget.count > 0)
                            {
                              widget.count--,
                            },
                          setState(
                            () => {},
                          )
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: EdgeInsets.all(10),
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: PloffColors.C_FAFAFA,
                            ),
                            child: SvgPicture.asset(Plofficons.minus)),
                      ),
                      Text("${widget.count}"),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.count++;
                          });
                        },
                        child: Container(
                            height: 32,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: PloffColors.C_FAFAFA,
                            ),
                            child: SvgPicture.asset(Plofficons.plus)),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
