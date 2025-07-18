import 'package:flutter/material.dart';

@immutable
class OrderResumeVO {
  final double subtotal;
  final double total;
  final double discount;
  final double discountPercentage;

  const OrderResumeVO({
    required this.subtotal,
    required this.total,
    required this.discount,
    required this.discountPercentage,
  });
}
