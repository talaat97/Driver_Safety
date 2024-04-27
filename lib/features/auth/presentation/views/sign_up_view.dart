import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/features/auth/presentation/views/widgets/sign_Up_view_builder.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultHomeView(widget:  SignUpViewBuilder());
  }
}
