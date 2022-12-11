import 'package:flutter/material.dart';
import 'package:ploff/screens/tab_box/home_tab/home_screen/home_screen.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class CategoryItem extends StatelessWidget {
  StateSetter setter;
  CategoryItem({super.key, required this.setter});

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
                  categoryIndex.add(index);
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
                            ) ==
                            index
                        ? PloffColors.C_FFCC00
                        : PloffColors.C_F0F0F0,
                  ),
                  child: const Center(
                    child: Text(
                      "Популярные блюда",
                      style: PloffTextStyle.w500,
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => Container(),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}

int selectedCategories({required int index}) {
  int k = 0;
  for (int i = 0; i < categoryIndex.length; i++) {
    k = 0;
    for (int j = 0; j < categoryIndex.length; j++) {
      if (categoryIndex[i] == categoryIndex[j]) {
        k++;
      }
    }
    if (k > 1) {
      for (int x = 0; x < categoryIndex.length; x++) {
        if (categoryIndex[i] == categoryIndex[x]) {
          categoryIndex.remove(categoryIndex[i]);
          categoryIndex.removeLast();
        }
      }
    }
  }

  for (int i = 0; i < categoryIndex.length; i++) {
    if (categoryIndex[i] == index) {
      return categoryIndex[i];
    }
  }

  return -1;
}
