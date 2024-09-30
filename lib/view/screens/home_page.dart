import 'package:flutter/material.dart';
import '../../controller/button_controller/button_controller.dart';
import '../../utilities/constant.dart';
import 'category_page.dart';

class HomePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final HomeController controller;

  const HomePage({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: AppConstants.screenWidth(context) * 0.1,
          bottom: AppConstants.screenHeight(context) * 0.07,
          right: AppConstants.screenHeight(context) * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'image_$title',
              child: Image.network(
                imagePath,
                width: AppConstants.screenWidth(context) * 0.3,
                height: AppConstants.screenHeight(context) * 0.2,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: AppConstants.screenHeight(context) * 0.03),
            TextUtils.buildText(
              "CRED $title",
              AppColors.kWhiteColor,
              18,
              FontWeight.bold,
            ),
            SizedBox(height: AppConstants.screenHeight(context) * 0.02),
            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.kWhiteColor,
                fontSize: 15,
                fontFamily: "MontserratSemiBold",
              ),
            ),
            SizedBox(
              height: AppConstants.screenHeight(context) * 0.05,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(controller: controller),
                  ),
                );
              },
              child: Container(
                height: AppConstants.screenHeight(context) * 0.07,
                width: AppConstants.screenWidth(context) * 0.8,
                decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Go To Category  ",
                      style: TextStyle(
                        color: AppColors.kMainColor,
                        fontFamily: "MontserratBold",
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_alt_sharp,
                      size: 38,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
