import 'package:ploff/data/local_database/cached_meals.dart';

class GetMeals {
  GetMeals() {
    addMeals();
  }
  List<CachedMeals> allMeals = [];

  List<CachedMeals> addMeals() {
    allMeals.add(
      CachedMeals(
        mealDescription: "Zo'r qilingan qoyil zo'r",
        mealName: "Go'ja",
        typeMeal: 1,
        priceMeal: 23000,
      ),
    );
    allMeals.add(
      CachedMeals(
        mealDescription: "Yaxshi",
        mealName: "Osh",
        typeMeal: 2,
        priceMeal: 3500,
      ),
    );
    allMeals.add(
      CachedMeals(
        mealDescription: "Zo'r",
        mealName: "Moshxorda",
        typeMeal: 2,
        priceMeal: 40000,
      ),
    );
    allMeals.add(
      CachedMeals(
        mealDescription: "Yaxshi qilinmagan",
        mealName: "Manti",
        typeMeal: 1,
        priceMeal: 13000,
      ),
    );
    allMeals.add(
      CachedMeals(
        mealDescription: "Chidasa bo'ladi",
        mealName: "Xonim",
        typeMeal: 2,
        priceMeal: 34000,
      ),
    );

    return allMeals;
  }
}
