import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileViewBuilder extends StatelessWidget {

  const ProfileViewBuilder({super.key, required this.body, required this.title});
  final Widget body;
  
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.primary,
      child: Column(
        children: 
        [
          Padding(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.075),
            child: Text(title, style: TextStyleManager.textStyleSemiBold.copyWith(
              color: ColorsManager.white,
              fontSize: 36.0
            ),),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight:  Radius.circular(30.0))
              ),
              child: body,
            ),
          )
        ],
      ),
    );
  }
}