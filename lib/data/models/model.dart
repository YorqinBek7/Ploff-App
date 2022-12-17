import 'dart:convert';

class Product {
  final bool active;
  final bool is_divisible;
  final bool has_modifier;
  final String order;
  final int in_price;
  final int out_price;
  final String currency;
  final String count;
  final String id;
  final String slug;
  final String image;
  final String code;
  final Gallery gallery;
  final String iiko_id;
  final String jowi_id;
  final Description description;
  final Title title;
  final Brand brand;
  final Measurement measurement;
  final Rate rate;
  final bool active_in_menu;
  final String from_time;
  final String to_time;
  final bool off_always;
  final Favorites favorites;
  final List<Categorie> categories;
  final Tags tags;
  final Product_property product_property;
  final Price_changers price_changers;
  final Properties properties;
  final Variant_products variant_products;
  final String type;
  Product({
    required this.active,
    required this.is_divisible,
    required this.has_modifier,
    required this.order,
    required this.in_price,
    required this.out_price,
    required this.currency,
    required this.count,
    required this.id,
    required this.slug,
    required this.image,
    required this.code,
    required this.gallery,
    required this.iiko_id,
    required this.jowi_id,
    required this.description,
    required this.title,
    required this.brand,
    required this.measurement,
    required this.rate,
    required this.active_in_menu,
    required this.from_time,
    required this.to_time,
    required this.off_always,
    required this.favorites,
    required this.categories,
    required this.tags,
    required this.product_property,
    required this.price_changers,
    required this.properties,
    required this.variant_products,
    required this.type,
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
    Gallery? gallery,
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
    List<Categorie>? categories,
    Tags? tags,
    Product_property? product_property,
    Price_changers? price_changers,
    Properties? properties,
    Variant_products? variant_products,
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
      gallery: gallery ?? this.gallery,
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
      tags: tags ?? this.tags,
      product_property: product_property ?? this.product_property,
      price_changers: price_changers ?? this.price_changers,
      properties: properties ?? this.properties,
      variant_products: variant_products ?? this.variant_products,
      type: type ?? this.type,
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
      'gallery': gallery.toMap(),
      'iiko_id': iiko_id,
      'jowi_id': jowi_id,
      'description': description.toMap(),
      'title': title.toMap(),
      'brand': brand.toMap(),
      'measurement': measurement.toMap(),
      'rate': rate.toMap(),
      'active_in_menu': active_in_menu,
      'from_time': from_time,
      'to_time': to_time,
      'off_always': off_always,
      'favorites': favorites.toMap(),
      'categories': categories.map((x) => x.toMap()).toList(),
      'tags': tags.toMap(),
      'product_property': product_property.toMap(),
      'price_changers': price_changers.toMap(),
      'properties': properties.toMap(),
      'variant_products': variant_products.toMap(),
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
      gallery: Gallery.fromMap(map['gallery'] as Map<String, dynamic>),
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
      favorites: Favorites.fromMap(map['favorites'] as Map<String, dynamic>),
      categories: List<Categorie>.from(
        (map['categories'] as List<int>).map<Categorie>(
          (x) => Categorie.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tags: Tags.fromMap(map['tags'] as Map<String, dynamic>),
      product_property: Product_property.fromMap(
          map['product_property'] as Map<String, dynamic>),
      price_changers:
          Price_changers.fromMap(map['price_changers'] as Map<String, dynamic>),
      properties: Properties.fromMap(map['properties'] as Map<String, dynamic>),
      variant_products: Variant_products.fromMap(
          map['variant_products'] as Map<String, dynamic>),
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(active: $active, is_divisible: $is_divisible, has_modifier: $has_modifier, order: $order, in_price: $in_price, out_price: $out_price, currency: $currency, count: $count, id: $id, slug: $slug, image: $image, code: $code, gallery: $gallery, iiko_id: $iiko_id, jowi_id: $jowi_id, description: $description, title: $title, brand: $brand, measurement: $measurement, rate: $rate, active_in_menu: $active_in_menu, from_time: $from_time, to_time: $to_time, off_always: $off_always, favorites: $favorites, categories: $categories, tags: $tags, product_property: $product_property, price_changers: $price_changers, properties: $properties, variant_products: $variant_products, type: $type)';
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
        other.gallery == gallery &&
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
        other.tags == tags &&
        other.product_property == product_property &&
        other.price_changers == price_changers &&
        other.properties == properties &&
        other.variant_products == variant_products &&
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
        gallery.hashCode ^
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
        tags.hashCode ^
        product_property.hashCode ^
        price_changers.hashCode ^
        properties.hashCode ^
        variant_products.hashCode ^
        type.hashCode;
  }
}

class Gallery {}

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
  final String id;
  final String slug;
  final Title title;
  final String short_name;
  final int accuracy;
  Measurement({
    required this.id,
    required this.slug,
    required this.title,
    required this.short_name,
    required this.accuracy,
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

class Categorie {
  final String id;
  final String slug;
  final String parent_id;
  final String image;
  final Description description;
  final Title title;
  final String order_no;
  final bool active;
  final Products products;
  Categorie({
    required this.id,
    required this.slug,
    required this.parent_id,
    required this.image,
    required this.description,
    required this.title,
    required this.order_no,
    required this.active,
    required this.products,
  });

  Categorie copyWith({
    String? id,
    String? slug,
    String? parent_id,
    String? image,
    Description? description,
    Title? title,
    String? order_no,
    bool? active,
    Products? products,
  }) {
    return Categorie(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      parent_id: parent_id ?? this.parent_id,
      image: image ?? this.image,
      description: description ?? this.description,
      title: title ?? this.title,
      order_no: order_no ?? this.order_no,
      active: active ?? this.active,
      products: products ?? this.products,
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
      'products': products.toMap(),
    };
  }

  factory Categorie.fromMap(Map<String, dynamic> map) {
    return Categorie(
      id: map['id'] as String,
      slug: map['slug'] as String,
      parent_id: map['parent_id'] as String,
      image: map['image'] as String,
      description:
          Description.fromMap(map['description'] as Map<String, dynamic>),
      title: Title.fromMap(map['title'] as Map<String, dynamic>),
      order_no: map['order_no'] as String,
      active: map['active'] as bool,
      products: Products.fromMap(map['products'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorie.fromJson(String source) =>
      Categorie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Categorie(id: $id, slug: $slug, parent_id: $parent_id, image: $image, description: $description, title: $title, order_no: $order_no, active: $active, products: $products)';
  }

  @override
  bool operator ==(covariant Categorie other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.slug == slug &&
        other.parent_id == parent_id &&
        other.image == image &&
        other.description == description &&
        other.title == title &&
        other.order_no == order_no &&
        other.active == active &&
        other.products == products;
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
        active.hashCode ^
        products.hashCode;
  }
}

class Products {}

class Tags {}

class Product_property {}

class Price_changers {}

class Properties {}

class Variant_products {}
