import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

class Product {
  final bool? active;
  final bool? is_divisible;
  final bool? has_modifier;
  final String? order;
  final int? in_price;
  final int out_price;
  final String? currency;
  final String? count;
  final String? id;
  final String? slug;
  final String? image;
  final String? code;
  final String? iiko_id;
  final String? jowi_id;
  final Description description;
  final Title? title;
  final Brand? brand;
  final Measurement measurement;
  final Rate? rate;
  final bool? active_in_menu;
  final String? from_time;
  final String? to_time;
  final bool? off_always;
  final Favorites? favorites;
  final List<Categories>? categories;
  final String? type;
  Product({
    this.active,
    this.is_divisible,
    this.has_modifier,
    this.order,
    this.in_price,
    required this.out_price,
    this.currency,
    this.count,
    this.id,
    this.slug,
    this.image,
    this.code,
    this.iiko_id,
    this.jowi_id,
    required this.description,
    this.title,
    this.brand,
    required this.measurement,
    this.rate,
    this.active_in_menu,
    this.from_time,
    this.to_time,
    this.off_always,
    this.favorites,
    this.categories,
    this.type,
  });

  Product copyWith({
    bool? active,
    bool? is_divisible,
    bool? has_modifier,
    String? order,
    int? in_price,
    int? out_price,
    String? currency,
    String? count,
    String? id,
    String? slug,
    String? image,
    String? code,
    String? iiko_id,
    String? jowi_id,
    Description? description,
    Title? title,
    Brand? brand,
    Measurement? measurement,
    Rate? rate,
    bool? active_in_menu,
    String? from_time,
    String? to_time,
    bool? off_always,
    Favorites? favorites,
    List<Categories>? categories,
    String? type,
  }) {
    return Product(
      active: active ?? this.active,
      is_divisible: is_divisible ?? this.is_divisible,
      has_modifier: has_modifier ?? this.has_modifier,
      order: order ?? this.order,
      in_price: in_price ?? this.in_price,
      out_price: out_price ?? this.out_price,
      currency: currency ?? this.currency,
      count: count ?? this.count,
      id: id ?? this.id,
      slug: slug ?? this.slug,
      image: image ?? this.image,
      code: code ?? this.code,
      iiko_id: iiko_id ?? this.iiko_id,
      jowi_id: jowi_id ?? this.jowi_id,
      description: description ?? this.description,
      title: title ?? this.title,
      brand: brand ?? this.brand,
      measurement: measurement ?? this.measurement,
      rate: rate ?? this.rate,
      active_in_menu: active_in_menu ?? this.active_in_menu,
      from_time: from_time ?? this.from_time,
      to_time: to_time ?? this.to_time,
      off_always: off_always ?? this.off_always,
      favorites: favorites ?? this.favorites,
      categories: categories ?? this.categories,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toBase() {
    return <String, dynamic>{
      'name': measurement.title.uz,
      'description': description.uz,
      'price': out_price.toString()
    };
  }

  factory Product.fromBase(Map<String, dynamic> map) {
    return Product(
      out_price: int.parse(map["price"]),
      description: Description(uz: map["description"], en: '', ru: ''),
      measurement: Measurement(title: Title(uz: map["name"], ru: "", en: "")),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'active': active,
      'is_divisible': is_divisible,
      'has_modifier': has_modifier,
      'order': order,
      'in_price': in_price,
      'out_price': out_price,
      'currency': currency,
      'count': count,
      'id': id,
      'slug': slug,
      'image': image,
      'code': code,
      'iiko_id': iiko_id,
      'jowi_id': jowi_id,
      'description': description.toMap(),
      'title': title!.toMap(),
      'brand': brand!.toMap(),
      'measurement': measurement.toMap(),
      'rate': rate!.toMap(),
      'active_in_menu': active_in_menu,
      'from_time': from_time,
      'to_time': to_time,
      'off_always': off_always,
      'favorites': favorites,
      'categories': categories!.map((x) => x.toMap()).toList(),
      'type': type,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      active: map['active'] as bool,
      is_divisible: map['is_divisible'] as bool,
      has_modifier: map['has_modifier'] as bool,
      order: map['order'] as String,
      in_price: map['in_price'].toInt() as int,
      out_price: map['out_price'].toInt() as int,
      currency: map['currency'] as String,
      count: map['count'] as String,
      id: map['id'] as String,
      slug: map['slug'] as String,
      image: map['image'] as String,
      code: map['code'] as String,
      iiko_id: map['iiko_id'] as String,
      jowi_id: map['jowi_id'] as String,
      description:
          Description.fromMap(map['description'] as Map<String, dynamic>),
      title: Title.fromMap(map['title'] as Map<String, dynamic>),
      brand: Brand.fromMap(map['brand'] as Map<String, dynamic>),
      measurement:
          Measurement.fromMap(map['measurement'] as Map<String, dynamic>),
      rate: Rate.fromMap(map['rate'] as Map<String, dynamic>),
      active_in_menu: map['active_in_menu'] as bool,
      from_time: map['from_time'] as String,
      to_time: map['to_time'] as String,
      off_always: map['off_always'] as bool,
      favorites: Favorites(),
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(active: $active, is_divisible: $is_divisible, has_modifier: $has_modifier, order: $order, in_price: $in_price, out_price: $out_price, currency: $currency, count: $count, id: $id, slug: $slug, image: $image, code: $code, iiko_id: $iiko_id, jowi_id: $jowi_id, description: $description, title: $title, brand: $brand, measurement: $measurement, rate: $rate, active_in_menu: $active_in_menu, from_time: $from_time, to_time: $to_time, off_always: $off_always, favorites: $favorites, categories: $categories)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.active == active &&
        other.is_divisible == is_divisible &&
        other.has_modifier == has_modifier &&
        other.order == order &&
        other.in_price == in_price &&
        other.out_price == out_price &&
        other.currency == currency &&
        other.count == count &&
        other.id == id &&
        other.slug == slug &&
        other.image == image &&
        other.code == code &&
        other.iiko_id == iiko_id &&
        other.jowi_id == jowi_id &&
        other.description == description &&
        other.title == title &&
        other.brand == brand &&
        other.measurement == measurement &&
        other.rate == rate &&
        other.active_in_menu == active_in_menu &&
        other.from_time == from_time &&
        other.to_time == to_time &&
        other.off_always == off_always &&
        other.favorites == favorites &&
        listEquals(other.categories, categories) &&
        other.type == type;
  }

  @override
  int get hashCode {
    return active.hashCode ^
        is_divisible.hashCode ^
        has_modifier.hashCode ^
        order.hashCode ^
        in_price.hashCode ^
        out_price.hashCode ^
        currency.hashCode ^
        count.hashCode ^
        id.hashCode ^
        slug.hashCode ^
        image.hashCode ^
        code.hashCode ^
        iiko_id.hashCode ^
        jowi_id.hashCode ^
        description.hashCode ^
        title.hashCode ^
        brand.hashCode ^
        measurement.hashCode ^
        rate.hashCode ^
        active_in_menu.hashCode ^
        from_time.hashCode ^
        to_time.hashCode ^
        off_always.hashCode ^
        favorites.hashCode ^
        categories.hashCode ^
        type.hashCode;
  }
}

class Description {
  final String uz;
  final String ru;
  final String en;
  Description({
    required this.uz,
    required this.ru,
    required this.en,
  });

  Description copyWith({
    String? uz,
    String? ru,
    String? en,
  }) {
    return Description(
      uz: uz ?? this.uz,
      ru: ru ?? this.ru,
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uz': uz,
      'ru': ru,
      'en': en,
    };
  }

  factory Description.fromMap(Map<String, dynamic> map) {
    return Description(
      uz: map['uz'] as String,
      ru: map['ru'] as String,
      en: map['en'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Description.fromJson(String source) =>
      Description.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Description(uz: $uz, ru: $ru, en: $en)';

  @override
  bool operator ==(covariant Description other) {
    if (identical(this, other)) return true;

    return other.uz == uz && other.ru == ru && other.en == en;
  }

  @override
  int get hashCode => uz.hashCode ^ ru.hashCode ^ en.hashCode;
}

class Title {
  final String uz;
  final String ru;
  final String en;
  Title({
    required this.uz,
    required this.ru,
    required this.en,
  });

  Title copyWith({
    String? uz,
    String? ru,
    String? en,
  }) {
    return Title(
      uz: uz ?? this.uz,
      ru: ru ?? this.ru,
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uz': uz,
      'ru': ru,
      'en': en,
    };
  }

  factory Title.fromMap(Map<String, dynamic> map) {
    return Title(
      uz: map['uz'] as String,
      ru: map['ru'] as String,
      en: map['en'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Title.fromJson(String source) =>
      Title.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Title(uz: $uz, ru: $ru, en: $en)';

  @override
  bool operator ==(covariant Title other) {
    if (identical(this, other)) return true;

    return other.uz == uz && other.ru == ru && other.en == en;
  }

  @override
  int get hashCode => uz.hashCode ^ ru.hashCode ^ en.hashCode;
}

class Brand {
  final String id;
  final String slug;
  final String parent_id;
  final String image;
  final Description description;
  final Title title;
  final String order_no;
  final bool is_active;
  Brand({
    required this.id,
    required this.slug,
    required this.parent_id,
    required this.image,
    required this.description,
    required this.title,
    required this.order_no,
    required this.is_active,
  });

  Brand copyWith({
    String? id,
    String? slug,
    String? parent_id,
    String? image,
    Description? description,
    Title? title,
    String? order_no,
    bool? is_active,
  }) {
    return Brand(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      parent_id: parent_id ?? this.parent_id,
      image: image ?? this.image,
      description: description ?? this.description,
      title: title ?? this.title,
      order_no: order_no ?? this.order_no,
      is_active: is_active ?? this.is_active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'parent_id': parent_id,
      'image': image,
      'description': description.toMap(),
      'title': title.toMap(),
      'order_no': order_no,
      'is_active': is_active,
    };
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      id: map['id'] as String,
      slug: map['slug'] as String,
      parent_id: map['parent_id'] as String,
      image: map['image'] as String,
      description:
          Description.fromMap(map['description'] as Map<String, dynamic>),
      title: Title.fromMap(map['title'] as Map<String, dynamic>),
      order_no: map['order_no'] as String,
      is_active: map['is_active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Brand.fromJson(String source) =>
      Brand.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Brand(id: $id, slug: $slug, parent_id: $parent_id, image: $image, description: $description, title: $title, order_no: $order_no, is_active: $is_active)';
  }

  @override
  bool operator ==(covariant Brand other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.slug == slug &&
        other.parent_id == parent_id &&
        other.image == image &&
        other.description == description &&
        other.title == title &&
        other.order_no == order_no &&
        other.is_active == is_active;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        slug.hashCode ^
        parent_id.hashCode ^
        image.hashCode ^
        description.hashCode ^
        title.hashCode ^
        order_no.hashCode ^
        is_active.hashCode;
  }
}

class Measurement {
  final String? id;
  final String? slug;
  final Title title;
  final String? short_name;
  final int? accuracy;
  Measurement({
    this.id,
    this.slug,
    required this.title,
    this.short_name,
    this.accuracy,
  });

  Measurement copyWith({
    String? id,
    String? slug,
    Title? title,
    String? short_name,
    int? accuracy,
  }) {
    return Measurement(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      title: title ?? this.title,
      short_name: short_name ?? this.short_name,
      accuracy: accuracy ?? this.accuracy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'title': title.toMap(),
      'short_name': short_name,
      'accuracy': accuracy,
    };
  }

  factory Measurement.fromMap(Map<String, dynamic> map) {
    return Measurement(
      id: map['id'] as String,
      slug: map['slug'] as String,
      title: Title.fromMap(map['title'] as Map<String, dynamic>),
      short_name: map['short_name'] as String,
      accuracy: map['accuracy'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Measurement.fromJson(String source) =>
      Measurement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Measurement(id: $id, slug: $slug, title: $title, short_name: $short_name, accuracy: $accuracy)';
  }

  @override
  bool operator ==(covariant Measurement other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.slug == slug &&
        other.title == title &&
        other.short_name == short_name &&
        other.accuracy == accuracy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        slug.hashCode ^
        title.hashCode ^
        short_name.hashCode ^
        accuracy.hashCode;
  }
}

class Rate {
  final String id;
  final String slug;
  final String code;
  final String rate_amount;
  final String title;
  Rate({
    required this.id,
    required this.slug,
    required this.code,
    required this.rate_amount,
    required this.title,
  });

  Rate copyWith({
    String? id,
    String? slug,
    String? code,
    String? rate_amount,
    String? title,
  }) {
    return Rate(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      code: code ?? this.code,
      rate_amount: rate_amount ?? this.rate_amount,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'code': code,
      'rate_amount': rate_amount,
      'title': title,
    };
  }

  factory Rate.fromMap(Map<String, dynamic> map) {
    return Rate(
      id: map['id'] as String,
      slug: map['slug'] as String,
      code: map['code'] as String,
      rate_amount: map['rate_amount'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rate.fromJson(String source) =>
      Rate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Rate(id: $id, slug: $slug, code: $code, rate_amount: $rate_amount, title: $title)';
  }

  @override
  bool operator ==(covariant Rate other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.slug == slug &&
        other.code == code &&
        other.rate_amount == rate_amount &&
        other.title == title;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        slug.hashCode ^
        code.hashCode ^
        rate_amount.hashCode ^
        title.hashCode;
  }
}

class Favorites {}

class Categories {
  final String id;
  final String slug;
  final String parent_id;
  final String image;
  final Description description;
  final Title title;
  final String order_no;
  final bool active;

  Categories({
    required this.id,
    required this.slug,
    required this.parent_id,
    required this.image,
    required this.description,
    required this.title,
    required this.order_no,
    required this.active,
  });

  Categories copyWith({
    String? id,
    String? slug,
    String? parent_id,
    String? image,
    Description? description,
    Title? title,
    String? order_no,
    bool? active,
  }) {
    return Categories(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      parent_id: parent_id ?? this.parent_id,
      image: image ?? this.image,
      description: description ?? this.description,
      title: title ?? this.title,
      order_no: order_no ?? this.order_no,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'parent_id': parent_id,
      'image': image,
      'description': description.toMap(),
      'title': title.toMap(),
      'order_no': order_no,
      'active': active,
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      id: map['id'] as String,
      slug: map['slug'] as String,
      parent_id: map['parent_id'] as String,
      image: map['image'] as String,
      description:
          Description.fromMap(map['description'] as Map<String, dynamic>),
      title: Title.fromMap(map['title'] as Map<String, dynamic>),
      order_no: map['order_no'] as String,
      active: map['active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) =>
      Categories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Categorie(id: $id, slug: $slug, parent_id: $parent_id, image: $image, description: $description, title: $title, order_no: $order_no, active: $active)';
  }

  @override
  bool operator ==(covariant Categories other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.slug == slug &&
        other.parent_id == parent_id &&
        other.image == image &&
        other.description == description &&
        other.title == title &&
        other.order_no == order_no &&
        other.active == active;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        slug.hashCode ^
        parent_id.hashCode ^
        image.hashCode ^
        description.hashCode ^
        title.hashCode ^
        order_no.hashCode ^
        active.hashCode;
  }
}
