import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/size_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, required this.label, required this.onPressed});

  final String label;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: const Color(0xffECE9E9),
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(SizeManager.formButtonRadiusSize)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(AssetsManager.google),
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyleManager.textStyleExtraBold.copyWith(
                    fontSize: 20,
                    color: ColorsManager.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
