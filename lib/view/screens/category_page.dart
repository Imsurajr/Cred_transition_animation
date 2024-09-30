import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../controller/button_controller/button_controller.dart';
import '../../utilities/constant.dart';
import '../animation/home_screen_animation_view.dart';
import '../widgets/grid_view/grid_view.dart';
import '../widgets/list_view/list_view.dart';

class CategoryPage extends StatefulWidget {
  final HomeController controller;

  const CategoryPage({super.key, required this.controller});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late GridViewBuilder gridViewBuilder;
  late ListViewBuilder listViewBuilder;

  @override
  void initState() {
    super.initState();
    gridViewBuilder = GridViewBuilder(widget.controller);
    listViewBuilder = ListViewBuilder(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreenAnimationView(
      duration: const Duration(milliseconds: 300),
      child: Scaffold(
        backgroundColor: AppColors.kMainColor,
        body: Padding(
          padding: EdgeInsets.only(
            top: AppConstants.screenWidth(context) * 0.25,
            left: AppConstants.screenWidth(context) * 0.075,
            right: AppConstants.screenWidth(context) * 0.025,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils.buildText(
                          "explore",
                          AppColors.kGreyColor.withOpacity(0.75),
                          20,
                          FontWeight.bold),
                      TextUtils.buildText(
                          "CRED", AppColors.kWhiteColor, 30, FontWeight.bold),
                      SizedBox(
                          height: AppConstants.screenHeight(context) * 0.015),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.controller.toggleView();
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: AppConstants.screenWidth(context) * 0.13,
                          height: AppConstants.screenHeight(context) * 0.03,
                          decoration: BoxDecoration(
                            color: AppColors.kMainColor,
                            border: Border.all(color: AppColors.kWhiteColor),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: widget.controller.isGridView
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width: AppConstants.screenWidth(context) *
                                      0.13 /
                                      2,
                                  height:
                                  AppConstants.screenHeight(context) * 0.03,
                                  decoration: BoxDecoration(
                                    color: AppColors.kWhiteColor,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      widget.controller.isGridView
                                          ? Icons.grid_view
                                          : Icons.list,
                                      color: AppColors.kMainColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: AppConstants.screenWidth(context) * 0.05),
                      GestureDetector(
                        onLongPress: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(
                                child: TextUtils.buildText("Close Button",
                                    AppColors.kWhiteColor, 15, FontWeight.bold),
                              ),
                            ),
                          );
                        },
                        onTap: () {
                          SystemNavigator.pop();
                          // This will close the app when pressed as asked in the problem statement of the assignment
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.kMainColor,
                            border: Border.all(
                                color: AppColors.kWhiteColor, width: 2.0),
                          ),
                          height: AppConstants.screenHeight(context) * 0.03,
                          width: AppConstants.screenWidth(context) * 0.14 / 2,
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: AppConstants.screenHeight(context) * 0.02,
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: widget.controller.isGridView
                    ? gridViewBuilder.buildGridView(context)
                    : listViewBuilder.buildListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
