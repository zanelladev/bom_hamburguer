import '../../../../core/core.dart';
import '../../domain/extensions/update_category_extension.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import 'categories_state.dart';

class CategoriesController extends AppNotifier<CategoriesState> {
  final GetCategoriesUsecase getCategoriesUsecase;

  CategoriesController(this.getCategoriesUsecase) : super(CategoriesInitialState());

  Future<void> fetchCategories() async {
    setData(CategoriesLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await getCategoriesUsecase.execute();

    result.fold(
      (failure) {
        setData(CategoriesErrorState(error: failure));
      },
      (categories) {
        if (categories.isEmpty) return setData(CategoriesEmptyState());

        setData(CategoriesLoadedState(categories: categories));
      },
    );
  }

  void toggleItemSelection(int itemId) {
    if (value is! CategoriesLoadedState) return;

    final categories = value.categories.map((category) {
      return category.selectItem(itemId);
    }).toList();

    setData(CategoriesLoadedState(categories: categories));
  }

  void clearSelection() {
    if (value is! CategoriesLoadedState) return;

    final categories = value.categories.map((category) {
      return category.clearSelection();
    }).toList();

    setData(CategoriesLoadedState(categories: categories));
  }
}
