import 'package:flutter/material.dart';
import '../../../controller/button_controller/button_controller.dart';
import '../../../model/data/data_source.dart';
import '../../../utilities/constant.dart';
import '../../animation/hero_animation.dart';

class ListViewBuilder {
  final HomeController controller;

  ListViewBuilder(this.controller);

  Widget buildListView(BuildContext context) {
    List<String> titles = DataSource.getTitles();

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        TextUtils.buildSectionTitle("MONEY"),
        ..._buildListTiles(context, titles.sublist(0, 3)),
        SizedBox(height: AppConstants.screenHeight(context) * 0.05),
        TextUtils.buildSectionTitle("BENEFITS"),
        ..._buildListTiles(context, titles.sublist(3, 8)),
        SizedBox(height: AppConstants.screenHeight(context) * 0.05),
        TextUtils.buildSectionTitle("BILLS"),
        ..._buildListTiles(context, titles.sublist(8)),
      ],
    );
  }

  List<Widget> _buildListTiles(BuildContext context, List<String> titles) {
    return titles.map((title) => _buildListTile(context, title)).toList();
  }

  Widget _buildListTile(BuildContext context, String title) {
    String subtitle = DataSource.getSubtitle(title);
    String imagePath = DataSource.getImagePath(title);
    return GestureDetector(
      onTap: () => NavigationUtils.navigateToDetails(
          context, title, subtitle, imagePath, controller),
      child: Material(
        color: AppColors.kMainColor,
        child: Container(
          height: AppConstants.screenHeight(context) * 0.11,
          child: ListTile(
            leading: Container(
              child: HeroAnimation.child(
                child: Image.network(imagePath, fit: BoxFit.contain),
                tag: 'image_$title',
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: AppColors.kWhiteColor)),
                Text(subtitle, style: TextStyle(color: AppColors.kGreyColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
