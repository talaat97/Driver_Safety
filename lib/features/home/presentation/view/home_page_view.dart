import 'package:driver_safety/core/shared_widgets/default_bottom_navigation_bar.dart';
import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_nav_cubit/home_nav_cubit.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_nav_cubit/home_nav_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavCubit, HomeNavStates>(
      builder: (context, state)=> DefaultHomeView(
        widget: HomeNavCubit.get(context).getCurrentView(),
        bottomNavigationBarWidget: const HomeBottomNavigationBar()
      )
    );
  }
}
