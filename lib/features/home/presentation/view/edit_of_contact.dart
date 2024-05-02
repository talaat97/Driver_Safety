import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:flutter/material.dart';

class EditOfContact extends StatelessWidget {
  const EditOfContact({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultHomeView(
      widget:  EditOfContactBuilder(),


    );
  }
}
