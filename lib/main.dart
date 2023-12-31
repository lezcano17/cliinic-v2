import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.getLoginRoute(),
      getPages: Routes.routes,
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black.withOpacity(1),
        ),
      ),
    );
  }
}
