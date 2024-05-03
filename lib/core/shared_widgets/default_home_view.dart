import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:driver_safety/core/shared_widgets/default_bottom_navigation_bar.dart';

class DefaultHomeView extends StatelessWidget {
  const DefaultHomeView(
      {super.key, required this.widget, this.bottomNavigationBarWidget,this.floatingActionButton});

  final Widget widget;
  final Widget? bottomNavigationBarWidget;
  final FloatingActionButton? floatingActionButton;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                AssetsManager.imageBackground,
                width: double.infinity,
                fit: BoxFit.fill,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.49,
              ),
              Expanded(
                child: Container(
                  color: ColorsManager.white,
                ),
              )
            ],
          ),
          widget,
        ],
      ),
      bottomNavigationBar: bottomNavigationBarWidget,
      floatingActionButton: floatingActionButton,
    );
  }


}
