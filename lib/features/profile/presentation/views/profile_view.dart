import 'package:driver_safety/core/shared_widgets/default_bottom_navigation_bar.dart';
import 'package:driver_safety/features/profile/presentation/views/widgets/profile_view_builder.dart';
import 'package:driver_safety/features/profile/presentation/views/widgets/profile_view_builder_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileViewBuilder(body: ProfileViewBuilderBody(),
      title: 'Profile',
      ),
      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }
}