import 'package:flutter/material.dart';
import '../controller/button_controller/button_controller.dart';
import '../view/screens/home_page.dart';

class AppColors {
  static const kMainColor = Color(0xFF000000);
  static const kBackgroundColor = Color(0xFFC49650);
  static const kGreyColor = Color(0xFF808080);
  static const kWhiteColor = Color(0xFFFFFFFF);
}

class AppConstants {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

class TextUtils {
  static Text buildSectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.kGreyColor.withOpacity(0.75),
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: "MontserratBold",
      ),
    );
  }

  static Text buildText(
      String text, Color color, double size, FontWeight weight) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: "MontserratBold",
      ),
    );
  }
}

class NavigationUtils {
  static void navigateToDetails(
    BuildContext context,
    String title,
    String subtitle,
    String imagePath,
    HomeController controller,
  ) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          title: title,
          subtitle: subtitle,
          imagePath: imagePath,
          controller: controller,
        ),
      ),
    );
  }
}
