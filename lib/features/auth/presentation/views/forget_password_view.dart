import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/features/auth/presentation/views/widgets/forget_password_view_builder.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultHomeView(widget: ForgetPasswordViewBuilder());
  }
}
