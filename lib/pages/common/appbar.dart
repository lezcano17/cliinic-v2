import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/routes.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Cliinic'),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            logout();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void logout() {
    /** Borrar id de sesión */

    Get.offAllNamed(Routes.getLoginRoute());
  }
}
