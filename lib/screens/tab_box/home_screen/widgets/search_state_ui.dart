import 'package:flutter/material.dart';
import 'package:ploff/cubits/get_product_categ_bann/get_product_and_category_cubit.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';

class SearchStateUi extends StatelessWidget {
  final GetProductAndCategoryState state;
  const SearchStateUi({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: state.searchedProducts.length,
        itemBuilder: (context, index) {
          var product = state.searchedProducts;

          return Column(
            children: [
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(10),
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
                      child: Text(product[index].title.uz),
                    ),
                    Expanded(child: Text(product[index].outPrice.toString()))
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
