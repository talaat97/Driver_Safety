import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/core/shared_widgets/default_bottom_navigation_bar.dart';
import 'package:driver_safety/features/home/presentation/view/concet_page.dart';
import 'package:driver_safety/features/home/presentation/view/message_page.dart';
import 'package:driver_safety/features/home/presentation/view/notifaction_page.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/home_page_view_builder.dart';

import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> activePage = const [
      HomePageViewBuilder(),
      NotifactionPage(),
      ContactPage(),
      MessagePage()
    ];
    return DefaultHomeView(
      widget:
      activePage[selectedPage],
      bottomNavigationBarWidget: const HomeBottomNavigationBar(),
    );
  }
}
