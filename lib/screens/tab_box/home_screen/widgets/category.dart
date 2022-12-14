import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ploff/cubits/get_categories/get_categories_cubit.dart';
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
          BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionFailure) {
                return Center(
                  child: Text(state.errorText),
                );
              } else if (state.status == FormzStatus.submissionInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context
                            .read<GetCategoriesCubit>()
                            .selectedCategories
                            .add(index);
                        setter(
                          () => {},
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
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
                            state.categories[index].name,
                            style: PloffTextStyle.w500,
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => Container(),
                    itemCount: state.categories.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

int selectedCategories({required int index, required BuildContext context}) {
  List<int> selectedCategories =
      context.read<GetCategoriesCubit>().selectedCategories;
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
