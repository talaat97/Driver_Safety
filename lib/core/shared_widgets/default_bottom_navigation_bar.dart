import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 20,
      iconSize: 50,
      items: [
        BottomNavigationBarItem(
            backgroundColor: ColorsManager.white,
            icon: SvgPicture.asset(AssetsManager.checkHand),
            label: '1'),
        BottomNavigationBarItem(
            backgroundColor: ColorsManager.white,
            icon: SvgPicture.asset(AssetsManager.userCall),
            label: '2'),
        BottomNavigationBarItem(
            backgroundColor: ColorsManager.white,
            icon: SvgPicture.asset(AssetsManager.chat),
            label: '3'),
        BottomNavigationBarItem(
            backgroundColor: ColorsManager.white,
            icon: SvgPicture.asset(AssetsManager.notification),
            label: '4'),
        BottomNavigationBarItem(
            backgroundColor: ColorsManager.white,
            icon:Icon(Icons.person,color: ColorsManager.primary,),
            label: '5'),

      ],
    ) ;
  }
}
