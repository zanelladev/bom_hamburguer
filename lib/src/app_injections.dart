import 'core/core.dart';
import 'modules/home/home_module_injections.dart';

abstract class AppInjections {
  static final List<ModuleInjections> _modules = [HomeModuleInjections()];

  static Future<void> initialize() async {
    await Future.forEach(_modules, (module) => module.registerBinds());
  }
}
