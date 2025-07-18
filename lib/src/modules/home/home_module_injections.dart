import '../../core/core.dart';
import 'presenter/controllers/home_controller.dart';

class HomeModuleInjections extends ModuleInjections {
  @override
  Future<void> registerBinds() async {
    ServiceLocator.instance.bindFactory<HomeController>(() => HomeController());
  }
}
