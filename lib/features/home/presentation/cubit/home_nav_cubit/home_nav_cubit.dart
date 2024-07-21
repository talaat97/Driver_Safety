import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_nav_cubit/home_nav_states.dart';
import 'package:driver_safety/features/home/presentation/view/concet_page.dart';
import 'package:driver_safety/features/home/presentation/view/message_page.dart';
import 'package:driver_safety/features/home/presentation/view/notifaction_page.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/home_page_view_builder.dart';
import 'package:driver_safety/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavCubit extends Cubit<HomeNavStates> {
  HomeNavCubit() : super(HomeNavInitialState());

  static HomeNavCubit get(context) => BlocProvider.of(context);

  List<Widget> activePage = const 
  [
      HomePageViewBuilder(),
      NotifactionPage(),
      ContactPage(),
      MessagePage(),
      ProfileView(),
  ];
  int currentIndex =0;
  void changeIndex({required int newIndex})
  {
    currentIndex = newIndex;
    emit(HomeNavChangeIndexState());
  }

  Color whichColor({required int index})
  {
    return currentIndex == index ? 
     ColorsManager.primary : 
     ColorsManager.primary.withOpacity(0.5);
  }

  Widget getCurrentView()
  {
    return activePage[currentIndex];
  }
}