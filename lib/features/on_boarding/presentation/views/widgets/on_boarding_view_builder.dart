import 'package:driver_safety/core/cache_helper/cache_helper.dart';
import 'package:driver_safety/core/cache_helper/cache_helper_keys.dart';
import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/logo_button.dart';
import 'package:driver_safety/features/auth/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingViewBuilder extends StatelessWidget {
  const OnBoardingViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ' Driver Safety ',
            style: TextStyleManager.textStyleSemiBold.copyWith( 
                fontSize: 36,
                color: ColorsManager.white,
                fontStyle: FontStyle.italic),
          ),
          Image.asset(AssetsManager.logo),
          Text('A good driving life better life',
              textAlign: TextAlign.center,
              style: TextStyleManager.textStyleRegular.copyWith(
                  fontSize: 32,
                  color: ColorsManager.white,
                  )),
          logoButton(label: "Let's Go", onPressed: () async {
          await  CacheHelper.saveData(key: CacheHelperKeys.firstOpen, value: true);
          Get.to(const SignInView());
          })
        ],
      ),
    );
  }
}
