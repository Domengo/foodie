// class FoodItem {
//   final String name;
//   final double price;
//   final String imageUrl;

//   FoodItem({required this.name, required this.price, required this.imageUrl});

//   factory FoodItem.fromJson(Map<String, dynamic> json) {
//     return FoodItem(
//       name: json['name']??'No Title',
//       price: (json['price']??0.0).toDouble(),
//       imageUrl: json['imageUrl']??'No Image',
//     );
//   }

// class FoodItem {
//   final String title;
//   final String image;

//   FoodItem({required this.title, required this.image});

//   factory FoodItem.fromJson(Map<String, dynamic> json) {
//     return FoodItem(
//       title: json['title'],
//       image: json['image'],
//     );
//   }


//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'image': image,
//     };
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    required String title,
    required String image,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);
}