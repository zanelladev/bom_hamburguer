import 'package:flutter/material.dart';

import '../entities/item_entity.dart';

@immutable
class OrderResumeVO {
  final double subtotal;
  final double total;
  final double discount;
  final double discountPercentage;
  final List<ItemEntity> items;

  const OrderResumeVO({
    required this.subtotal,
    required this.total,
    required this.discount,
    required this.discountPercentage,
    required this.items,
  });
}
