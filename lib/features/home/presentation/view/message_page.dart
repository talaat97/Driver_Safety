import 'package:driver_safety/core/shared_widgets/default_bottom_navigation_bar.dart';
import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/message_page_builder.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultHomeView(
      widget: MessagaPageBuilder(),
      bottomNavigationBarWidget: HomeBottomNavigationBar(),
    );
  }
}
