const String tableName = "meals";

class CachedMealsFields {
  static const String id = "id";
  static const String nameMeal = "name_meal";
  static const String priceMeal = "price_meal";
  static const String typeMeal = "type_meal";
  static const String mealDescription = "meal_description";
}

class CachedMeals {
  final int? id;
  final String mealName;
  final String mealDescription;
  final double priceMeal;
  final int typeMeal;
  CachedMeals({
    this.id,
    required this.mealName,
    required this.priceMeal,
    required this.typeMeal,
    required this.mealDescription,
  });

  CachedMeals copyWith({
    int? id,
    String? mealName,
    double? priceMeal,
    int? typeMeal,
    String? mealDescription,
  }) {
    return CachedMeals(
      id: id ?? this.id,
      mealName: mealName ?? this.mealName,
      priceMeal: priceMeal ?? this.priceMeal,
      typeMeal: typeMeal ?? this.typeMeal,
      mealDescription: mealDescription ?? this.mealDescription,
    );
  }

  static CachedMeals fromJson(Map<String, dynamic> json) {
    return CachedMeals(
      id: json[CachedMealsFields.id] as int,
      mealName: json[CachedMealsFields.nameMeal] as String,
      priceMeal: json[CachedMealsFields.priceMeal] as double,
      typeMeal: json[CachedMealsFields.typeMeal] as int,
      mealDescription: json[CachedMealsFields.mealDescription] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CachedMealsFields.id: id,
      CachedMealsFields.nameMeal: mealName,
      CachedMealsFields.priceMeal: priceMeal,
      CachedMealsFields.typeMeal: typeMeal,
      CachedMealsFields.mealDescription: mealDescription
    };
  }
}
