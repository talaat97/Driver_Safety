import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_nav_cubit/home_nav_cubit.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_nav_cubit/home_nav_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  final double iconSize = 30;
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavCubit, HomeNavStates>(
      builder: (context, state)=> BottomNavigationBar(
        onTap: (int newIndex){HomeNavCubit.get(context).changeIndex(newIndex: newIndex);},
        currentIndex: HomeNavCubit.get(context).currentIndex,
        elevation: 5,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              backgroundColor: ColorsManager.white,
              icon: SvgPicture.asset(
                AssetsManager.checkHand,
                height: iconSize,
                width: iconSize,
                color: HomeNavCubit.get(context).whichColor(index: 0),
              ),
              label: 'checkHand'),
          BottomNavigationBarItem(
              backgroundColor: ColorsManager.white,
              icon: SvgPicture.asset(
                AssetsManager.notification,
                height: iconSize,
                width: iconSize,
                color: HomeNavCubit.get(context).whichColor(index: 1),
              ),
              label: 'notification'),
          BottomNavigationBarItem(
              backgroundColor: ColorsManager.white,
              icon: SvgPicture.asset(
                AssetsManager.userCall,
                height: iconSize,
                width: iconSize,
                color: HomeNavCubit.get(context).whichColor(index: 2),
              ),
              label: 'userCall'),
          BottomNavigationBarItem(
              backgroundColor: ColorsManager.white,
              icon: SvgPicture.asset(
                AssetsManager.chat,
                height: iconSize,
                width: iconSize,
                color: HomeNavCubit.get(context).whichColor(index: 3),
              ),
              label: 'chat'),
          BottomNavigationBarItem(
              backgroundColor: ColorsManager.white,
              icon: SvgPicture.asset(
                AssetsManager.personNav,
                height: iconSize,
                width: iconSize,
                color: HomeNavCubit.get(context).whichColor(index: 4),
              ),
              label: 'person'),
        ],
      )
    );
  }
}
