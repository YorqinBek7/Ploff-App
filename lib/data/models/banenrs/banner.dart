import 'dart:convert';

import 'package:ploff/data/models/banenrs/banners.dart';
import 'package:ploff/data/models/banenrs/title.dart';

class Banner {
  final String id;
  final Title title;
  final String position;
  final String image;
  final String url;
  final bool active;
  final String created_at;
  final String updated_at;
  final String shipper_id;
  final String about;
  Banner({
    required this.id,
    required this.title,
    required this.position,
    required this.image,
    required this.url,
    required this.active,
    required this.created_at,
    required this.updated_at,
    required this.shipper_id,
    required this.about,
  });

  Banner copyWith({
    String? id,
    Title? title,
    String? position,
    String? image,
    String? url,
    bool? active,
    String? created_at,
    String? updated_at,
    String? shipper_id,
    String? about,
  }) {
    return Banner(
      id: id ?? this.id,
      title: title ?? this.title,
      position: position ?? this.position,
      image: image ?? this.image,
      url: url ?? this.url,
      active: active ?? this.active,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      shipper_id: shipper_id ?? this.shipper_id,
      about: about ?? this.about,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title.toMap(),
      'position': position,
      'image': image,
      'url': url,
      'active': active,
      'created_at': created_at,
      'updated_at': updated_at,
      'shipper_id': shipper_id,
      'about': about,
    };
  }

  factory Banner.fromMap(Map<String, dynamic> map) {
    return Banner(
      id: map['id'] as String,
      title: Title.fromMap(map['title'] as Map<String, dynamic>),
      position: map['position'] as String,
      image: map['image'] as String,
      url: map['url'] as String,
      active: map['active'] as bool,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      shipper_id: map['shipper_id'] as String,
      about: map['about'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Banner.fromJson(String source) =>
      Banner.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Banner(id: $id, title: $title, position: $position, image: $image, url: $url, active: $active, created_at: $created_at, updated_at: $updated_at, shipper_id: $shipper_id, about: $about)';
  }

  @override
  bool operator ==(covariant Banner other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.position == position &&
        other.image == image &&
        other.url == url &&
        other.active == active &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.shipper_id == shipper_id &&
        other.about == about;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        position.hashCode ^
        image.hashCode ^
        url.hashCode ^
        active.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        shipper_id.hashCode ^
        about.hashCode;
  }
}
