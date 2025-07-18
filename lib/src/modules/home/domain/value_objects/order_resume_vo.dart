import 'package:flutter/material.dart';

@immutable
class OrderResumeVO {
  final double subtotal;
  final double total;
  final double discount;

  const OrderResumeVO({
    required this.subtotal,
    required this.total,
    required this.discount,
  });
}
