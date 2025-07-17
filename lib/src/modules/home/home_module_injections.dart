import '../../core/core.dart';
import 'presenter/controller/home_controller.dart';

class HomeModuleInjections extends ModuleInjections {
  @override
  Future<void> registerBinds() async {
    ServiceLocator.instance.bindFactory<HomeController>(() => HomeController());
  }
}
