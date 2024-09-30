import 'package:flutter/material.dart';
import 'controller/button_controller/button_controller.dart';
import 'model/buttons/buttons.dart';
import 'model/data/data_source.dart';
import 'view/screens/home_page.dart';

void main() {
  final model = HomeModel();
  final controller = HomeController(model);

  runApp(MyApp(controller: controller));
}

class MyApp extends StatelessWidget {
  final HomeController controller;

  const MyApp({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String title = DataSource.getLandingTitle();
    String subtitle = DataSource.getLandingSubtitle();
    String imagePath = DataSource.getLandingImagePath();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(
          title: title,
          subtitle: subtitle,
          imagePath: imagePath,
          controller: controller,
        ),
      ),
    );
  }
}
