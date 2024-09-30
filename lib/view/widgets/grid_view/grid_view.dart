import 'package:flutter/material.dart';
import '../../../controller/button_controller/button_controller.dart';
import '../../../model/data/data_source.dart';
import '../../../utilities/constant.dart';
import '../../animation/hero_animation.dart';

class GridViewBuilder {
  final HomeController controller;

  GridViewBuilder(this.controller);

  Widget buildGridView(BuildContext context) {
    List<String> titles = DataSource.getTitles();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppConstants.screenHeight(context) * 0.035),
          TextUtils.buildSectionTitle("MONEY"),
          SizedBox(height: AppConstants.screenHeight(context) * 0.025),
          _buildGridRow(context, titles.sublist(0, 3)),
          SizedBox(height: AppConstants.screenHeight(context) * 0.025),
          TextUtils.buildSectionTitle("BENEFITS"),
          SizedBox(height: AppConstants.screenHeight(context) * 0.025),
          _buildGridRow(context, titles.sublist(3, 8)),
          SizedBox(height: AppConstants.screenHeight(context) * 0.025),
          TextUtils.buildSectionTitle("BILLS"),
          SizedBox(height: AppConstants.screenHeight(context) * 0.025),
          _buildGridRow(context, titles.sublist(8)),
        ],
      ),
    );
  }

  Widget _buildGridRow(BuildContext context, List<String> items) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: items.map((item) => _buildGridTile(context, item)).toList(),
    );
  }

  Widget _buildGridTile(BuildContext context, String title) {
    String subtitle = DataSource.getSubtitle(title);
    String imagePath = DataSource.getImagePath(title);
    return InkWell(
      onTap: () => NavigationUtils.navigateToDetails(
          context, title, subtitle, imagePath, controller),
      child: Container(
        width: 80,
        child: Column(
          children: [
            Container(
              child: HeroAnimation.child(
                tag: 'image_$title',
                child: Image.network(imagePath, fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: AppConstants.screenHeight(context) * 0.01),
            Text(
              title,
              style: TextStyle(color: AppColors.kWhiteColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
