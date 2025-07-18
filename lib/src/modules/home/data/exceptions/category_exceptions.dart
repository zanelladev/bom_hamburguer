import '../../../../core/core.dart';

/// Base class for ategory exceptions, extending the [AppException] class.
/// This class is sealed, meaning it cannot be directly instantiated but can be extended.
sealed class CategoryException extends AppException {
  /// Creates an [CategoryException] with the provided [message], [stackTrace], and [code].
  const CategoryException({
    required super.message,
    required super.stackTrace,
    required super.code,
  });
}

/// Exception thrown when there is an error getting categories.
///
/// The `GetCategoriesException` is a specialized exception that inherits from
/// `CategoryException`. It indicates that an error occurred while attempting to
/// retrieve a JSON object from storage.
class GetCategoriesException extends CategoryException {
  /// Constructs a `GetCategoriesException`.
  const GetCategoriesException({
    required super.message,
    required super.stackTrace,
  }) : super(code: 'get_categories');
}
