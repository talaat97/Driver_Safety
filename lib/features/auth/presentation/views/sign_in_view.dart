import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/features/auth/presentation/views/widgets/sign_In_view_builder.dart';

import 'package:flutter/material.dart';

import '../../../../core/resources_manager/color_manager.dart';
import '../../../../core/resources_manager/style_manager.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.47,
            child: Stack(
              children: [
                Image.asset(
                  AssetsManager.carBackGround, 
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    ' Driver Safety ',
                    style: TextStyleManager.textStyleSemiBold.copyWith(
                        fontSize: 36,
                        color: ColorsManager.white,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              //child: SignInViewBuilder(),
              height: MediaQuery.of(context).size.height * 0.57,
              width: double.infinity,
              child:  const SignInViewBuilder(),
            ),
          ),
        ],
      ),
    );
  }
}
