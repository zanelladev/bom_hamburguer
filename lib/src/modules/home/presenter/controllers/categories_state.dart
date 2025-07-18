import '../../../../core/core.dart';
import '../../domain/entities/category_entity.dart';

sealed class CategoriesState {
  bool get isLoading => this is CategoriesLoadingState;
  bool get isEmpty => this is CategoriesEmptyState;
  bool get isError => this is CategoriesErrorState;
  bool get isLoaded => this is CategoriesLoadedState;

  final List<CategoryEntity> categories;

  const CategoriesState({
    required this.categories,
  });
}

class CategoriesInitialState extends CategoriesState {
  CategoriesInitialState() : super(categories: []);
}

class CategoriesLoadingState extends CategoriesState {
  CategoriesLoadingState() : super(categories: []);
}

class CategoriesLoadedState extends CategoriesState {
  const CategoriesLoadedState({
    required super.categories,
  });
}

class CategoriesEmptyState extends CategoriesState {
  CategoriesEmptyState() : super(categories: []);
}

class CategoriesErrorState extends CategoriesState {
  final AppError error;

  CategoriesErrorState({
    required this.error,
  }) : super(categories: []);
}
