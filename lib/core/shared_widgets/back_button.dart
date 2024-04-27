import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(AssetsManager.backButton),
        ),
      ),
    );
  }
}
