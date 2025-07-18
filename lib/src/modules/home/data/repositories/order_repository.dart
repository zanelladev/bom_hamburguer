import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/constants/data_constants.dart';
import '../../../../core/core.dart';
import '../../domain/dtos/order_item_dto.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/i_order_repository.dart';
import '../../domain/value_objects/order_resume_vo.dart';
import '../exceptions/order_exceptions.dart';

class OrderRepository implements IOrderRepository {
  @override
  AsyncResult<OrderResumeVO> getOrderResume(OrderDto dto) async {
    try {
      final jsonString = await rootBundle.loadString(DataConstants.categoriesData);

      final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;

      final categories = jsonList.map((json) {
        return CategoryEntity.fromMap(json as Map<String, dynamic>);
      }).toList();

      double subtotal = 0;
      final selectedIds = dto.items.map((item) => item.id).toSet();

      for (final orderItem in dto.items) {
        final category = categories.firstWhere(
          (cat) => cat.items.any((item) => item.id == orderItem.id),
          orElse: () => throw Exception('Item ID ${orderItem.id} not found.'),
        );

        final item = category.items.firstWhere((item) => item.id == orderItem.id);

        subtotal += item.price * orderItem.count;
      }

      double discountPercentage = 0;

      final hasSandwich = selectedIds.any((id) => [1, 2, 3].contains(id));
      final hasFries = selectedIds.contains(4);
      final hasSoftDrink = selectedIds.contains(5);

      if (hasSandwich && hasFries && hasSoftDrink) {
        discountPercentage = 20;
      } else if (hasSandwich && hasSoftDrink) {
        discountPercentage = 15;
      } else if (hasSandwich && hasFries) {
        discountPercentage = 10;
      }

      final discount = subtotal * (discountPercentage / 100);
      final total = subtotal - discount;

      return right(OrderResumeVO(
        total: total,
        subtotal: subtotal,
        discount: discount,
        discountPercentage: discountPercentage,
        itemsCount: dto.items.length,
      ));
    } catch (e) {
      return left(FailedToGetOrderResume());
    }
  }
}
