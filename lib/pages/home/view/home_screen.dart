import 'package:cliinic_v2/pages/common/appbar.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 120,
              icon: Icon(Icons.camera),
              onPressed: () {
                goToFormFichaScreen();
              },
            ),
            SizedBox(height: 32),
            Text(
              'Agregar nueva ficha',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 64),
            IconButton(
              iconSize: 120,
              icon: Icon(Icons.photo),
              onPressed: () {
                goToFichaScreen();
              },
            ),
            SizedBox(height: 32),
            Text(
              'Consultar fichas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
