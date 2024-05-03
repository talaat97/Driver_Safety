import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:flutter/material.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/edit_of_contact_builder.dart';

class EditOfContact extends StatelessWidget {
  const EditOfContact({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultHomeView(
      widget: EditOfContactBuilder(),
    );
  }
}
