import 'core/core.dart';

abstract class AppInjections {
  static const List<AppModule> _modules = [];

  static Future<void> initialize() async {
    await Future.forEach(_modules, (module) => module.registerBinds());
  }
}
