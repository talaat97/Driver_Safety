import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/core/shared_widgets/default_bottom_navigation_bar.dart';
import 'package:driver_safety/features/home/presentation/view/concet_page.dart';
import 'package:driver_safety/features/home/presentation/view/message_page.dart';
import 'package:driver_safety/features/home/presentation/view/notifaction_page.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/home_page_view_builder.dart';

import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {


    List <Widget> activePage =const [HomePageViewBuilder(),ContactPage(),NotifactionPage(),MessagePage()] ;
    return  DefaultHomeView(
      widget: activePage[0],
      bottomNavigationBarWidget:const HomeBottomNavigationBar(),
    );
  }
}
