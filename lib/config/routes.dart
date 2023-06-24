import 'package:cliinic_v2/pages/ficha/form/ficha_form.dart';
import 'package:cliinic_v2/pages/ficha/view/ficha_screen.dart';
import 'package:get/route_manager.dart';

import '../pages/home/view/home_screen.dart';
import '../pages/login/view/login_screen.dart';

class Routes {
  static const String _login = "/";
  static const String _home = '/home';
  static const String _fichaForm = '/home/ficha/form';
  static const String _ficha = '/home/ficha';

  static String getLoginRoute() => _login;
  static String getHomeRoute() => _home;
  static String getFichaRoute() => _ficha;
  static String getFichaFormRoute() => _fichaForm;

  static List<GetPage> routes = [
    GetPage(
      name: getLoginRoute(),
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: getHomeRoute(),
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: getFichaRoute(),
      page: () => FichaScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: getFichaFormRoute(),
      page: () => FichaFormScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
