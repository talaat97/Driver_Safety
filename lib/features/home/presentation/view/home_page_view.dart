import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/features/home/presentation/view/concet_page.dart';
import 'package:driver_safety/features/home/presentation/view/message_page.dart';
import 'package:driver_safety/features/home/presentation/view/notifaction_page.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/home_page_view_builder.dart';
import 'package:driver_safety/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
int selectedPage = 0 ;
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
      MessagePage(),
      ProfileView(),

    ];
    return DefaultHomeView(
      widget: activePage[selectedPage],
      bottomNavigationBarWidget: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
          print(selectedPage);
        },
        currentIndex: selectedPage,
        elevation: 20,
        iconSize: 50,
        items: [
          BottomNavigationBarItem(
              backgroundColor: ColorsManager.white,
              icon: SvgPicture.asset(AssetsManager.checkHand),
              label: 'checkHand'),
          BottomNavigationBarItem(
              backgroundColor: ColorsManager.white,
              icon: SvgPicture.asset(AssetsManager.notification),
              label: 'notification'),
          BottomNavigationBarItem(
              backgroundColor: ColorsManager.white,
              icon: SvgPicture.asset(AssetsManager.userCall),
              label: 'userCall'),
          BottomNavigationBarItem(
              backgroundColor: ColorsManager.white,
              icon: SvgPicture.asset(AssetsManager.chat),
              label: 'chat'),
          const BottomNavigationBarItem(
              backgroundColor: ColorsManager.white,
              icon: Icon(
                Icons.person,
                color: ColorsManager.primary,
              ),
              label: 'person'),
        ],
      ),
    );
  }
}
