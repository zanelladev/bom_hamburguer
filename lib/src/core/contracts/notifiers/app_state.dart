abstract class AppState {
  final AppStatus status;

  const AppState({this.status = AppStatus.initial});

  bool get isInitial => status == AppStatus.initial;
  bool get isLoading => status == AppStatus.loading;
  bool get isSuccess => status == AppStatus.success;
  bool get isError => status == AppStatus.error;
}

enum AppStatus {
  initial,
  loading,
  loaded,
  success,
  error,
}
