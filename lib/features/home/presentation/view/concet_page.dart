import 'package:driver_safety/core/shared_widgets/default_bottom_navigation_bar.dart';
import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/contact_page_builder.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultHomeView(
      widget: const ContactPageBuilder(),
      floatingActionButton: FloatingActionButton(

          onPressed: (){}),
      bottomNavigationBarWidget: const HomeBottomNavigationBar(),
    );
  }
}
