import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/back_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetLocationBuilder extends StatelessWidget {
  const GetLocationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DefaultBackButton(),
              Text('Driver safety',
                  style: TextStyleManager.textStyleBold
                      .copyWith(color: ColorsManager.white, fontSize: 24)),
            ],
          ),
        ),
        const SizedBox(height: 200),
        Expanded(
          child: Column(
            children: [
              Text(
                'current location',
                style: TextStyleManager.textStyleRegular.copyWith(
                    color: ColorsManager.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              const Icon(Icons.location_on_rounded, size: 100),
              const SizedBox(height: 20),
              const CircularProgressIndicator(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
          child: FormButton(
            label: 'continue',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
