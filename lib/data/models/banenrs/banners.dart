import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ploff/data/models/banenrs/banner.dart';

class Banners {
  final List<Banner> banners;
  final String count;
  Banners({
    required this.banners,
    required this.count,
  });

  Banners copyWith({
    List<Banner>? banners,
    String? count,
  }) {
    return Banners(
      banners: banners ?? this.banners,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'banners': banners.map((x) => x.toMap()).toList(),
      'count': count,
    };
  }

  factory Banners.fromMap(Map<String, dynamic> map) {
    return Banners(
      banners: List<Banner>.from(
        (map['banners'] as List<int>).map<Banner>(
          (x) => Banner.fromMap(x as Map<String, dynamic>),
        ),
      ),
      count: map['count'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Banners.fromJson(String source) =>
      Banners.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Banners(banners: $banners, count: $count)';

  @override
  bool operator ==(covariant Banners other) {
    if (identical(this, other)) return true;

    return listEquals(other.banners, banners) && other.count == count;
  }

  @override
  int get hashCode => banners.hashCode ^ count.hashCode;
}
