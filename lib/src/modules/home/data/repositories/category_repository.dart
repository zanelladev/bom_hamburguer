import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/core.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/i_category_repository.dart';
import '../exceptions/category_exceptions.dart';

class CategoryRepository implements ICategoryRepository {
  @override
  AsyncResult<List<CategoryEntity>> getCategories() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      String jsonString = await rootBundle.loadString(
        'assets/categories_data.json',
      );

      final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;

      final categories = jsonList.map((json) {
        return CategoryEntity.fromMap(json as Map<String, dynamic>);
      }).toList();

      return right(categories);
    } catch (e, st) {
      return left(GetCategoriesException(
        message: 'Failed to get categories',
        stackTrace: st,
      ));
    }
  }
}
