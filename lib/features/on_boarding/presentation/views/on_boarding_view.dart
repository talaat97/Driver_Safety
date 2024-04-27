import 'package:driver_safety/features/on_boarding/presentation/views/widgets/on_boarding_view_builder.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources_manager/color_manager.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsManager.brown,
              ColorsManager.primary,
            ],
            begin: Alignment.topCenter,
            end:Alignment.bottomCenter,
          ),
        ),
child: OnBoardingViewBuilder(),
      ),
    );
  }
}
