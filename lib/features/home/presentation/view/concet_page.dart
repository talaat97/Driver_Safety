import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/features/home/presentation/view/edit_of_contact.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/contact_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultHomeView(
      widget: const ContactPageBuilder(),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: ColorsManager.primary,
          child: const Icon(
            Icons.add,
            color: ColorsManager.white,
            size: 35,
          ),
          onPressed: () {
            Get.to(const EditOfContact());
          }),
    );
  }
}
