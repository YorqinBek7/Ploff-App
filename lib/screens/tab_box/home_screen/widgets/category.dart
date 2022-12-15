import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff/cubits/get_product_categ_bann/get_product_and_category_cubit.dart';
import 'package:ploff/data/models/categories/categories.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class CategoryItem extends StatelessWidget {
  StateSetter setter;
  List<Categorie> categorie;
  CategoryItem({super.key, required this.setter, required this.categorie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context
                      .read<GetProductAndCategoryCubit>()
                      .selectedCategories
                      .add(index);
                  setter(
                    () => {},
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.only(
                    left: index == 0 ? 10 : 5,
                    right: index == 5 - 1 ? 10 : 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selectedCategories(
                              index: index,
                              context: context,
                            ) ==
                            index
                        ? PloffColors.C_FFCC00
                        : PloffColors.C_F0F0F0,
                  ),
                  child: Center(
                    child: Text(
                      categorie[index].name,
                      style: PloffTextStyle.w500,
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => Container(),
              itemCount: categorie.length,
            ),
          ),
        ],
      ),
    );
  }
}

int selectedCategories({required int index, required BuildContext context}) {
  List<int> selectedCategories =
      context.read<GetProductAndCategoryCubit>().selectedCategories;
  int k = 0;
  for (int i = 0; i < selectedCategories.length; i++) {
    k = 0;
    for (int j = 0; j < selectedCategories.length; j++) {
      if (selectedCategories[i] == selectedCategories[j]) {
        k++;
      }
    }
    if (k > 1) {
      for (int x = 0; x < selectedCategories.length; x++) {
        if (selectedCategories[i] == selectedCategories[x]) {
          selectedCategories.remove(selectedCategories[i]);
          selectedCategories.removeLast();
        }
      }
    }
  }

  for (int i = 0; i < selectedCategories.length; i++) {
    if (selectedCategories[i] == index) {
      return selectedCategories[i];
    }
  }

  return -1;
}
