import 'package:cliinic_v2/config/routes.dart';
import 'package:get/route_manager.dart';

void goToFormFichaScreen() {
  Get.toNamed(Routes.getFichaFormRoute());
}

void goToFichaScreen() {
  Get.toNamed(Routes.getFichaRoute());
}
