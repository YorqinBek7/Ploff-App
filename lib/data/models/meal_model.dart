class AboutMeal {
  final String mealName;
  final String mealDescription;
  final String mealPrice;
  AboutMeal({
    required this.mealDescription,
    required this.mealName,
    required this.mealPrice,
  });
}

class GetMeals {
  GetMeals() {
    addMeals();
  }
  List<AboutMeal> allMeals = [];

  List<AboutMeal> addMeals() {
    allMeals.add(
      AboutMeal(
        mealDescription: "Zo'r qilingan qoyil zo'r",
        mealName: "Go'ja",
        mealPrice: "23 000",
      ),
    );
    allMeals.add(
      AboutMeal(
        mealDescription: "Yaxshi",
        mealName: "Osh",
        mealPrice: "45 000",
      ),
    );
    allMeals.add(
      AboutMeal(
        mealDescription: "Zo'r",
        mealName: "Moshxorda",
        mealPrice: "20 000 ",
      ),
    );
    allMeals.add(
      AboutMeal(
        mealDescription: "Yaxshi qilinmagan",
        mealName: "Manti",
        mealPrice: "12 000",
      ),
    );
    allMeals.add(
      AboutMeal(
        mealDescription: "Chidasa bo'ladi",
        mealName: "Xonim",
        mealPrice: "25 000",
      ),
    );

    return allMeals;
  }
}
