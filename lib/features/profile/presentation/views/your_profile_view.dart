import 'package:driver_safety/features/profile/presentation/views/widgets/profile_view_builder.dart';
import 'package:driver_safety/features/profile/presentation/views/widgets/your_profile_view_body.dart';
import 'package:flutter/material.dart';

class YourProfileView extends StatelessWidget {
  const YourProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileViewBuilder(
        title: 'Your Profile',
        body: YourProfileViewBody(),
      ),
    );
  }
}