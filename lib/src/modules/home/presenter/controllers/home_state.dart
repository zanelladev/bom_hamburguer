import '../../../../core/core.dart';
import '../../domain/entities/category_entity.dart';

class HomeState extends AppState {
  final List<CategoryEntity> categories;

  const HomeState({
    required this.categories,
    super.status = AppStatus.initial,
  });

  HomeState copyWith({
    List<CategoryEntity>? categories,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
    );
  }
}
