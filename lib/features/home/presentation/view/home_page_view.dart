import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/core/shared_widgets/default_bottom_navigation_bar.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/home_page_view_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultHomeView(
      widget: const HomePageViewBuilder(),
      bottomNavigationBarWidget:  HomeBottomNavigationBar(),
    );
  }
}
