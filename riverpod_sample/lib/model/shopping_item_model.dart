import 'package:flutter/material.dart';

@immutable
class ShoppingItemModel {
  final String name;
  final int quantity;
  final bool hasBought;
  final bool isSpicy;

  const ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });

  /// 모델이 final 이라 직접 바꿀 수 없기때문에
  /// 아래와 같은 copyWith 함수를 직접 만듦
  ShoppingItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }

}
