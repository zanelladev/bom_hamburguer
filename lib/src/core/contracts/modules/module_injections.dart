import '../../core.dart';

abstract class ModuleInjections {
  Future<void> registerBinds();

  T get<T extends Object>() => ServiceLocator.instance.get<T>();
}
