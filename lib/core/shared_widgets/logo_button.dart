import 'package:flutter/material.dart';

import '../resources_manager/color_manager.dart';
import '../resources_manager/size_manager.dart';
import '../resources_manager/style_manager.dart';


class logoButton extends StatelessWidget {
  const logoButton({super.key, required this.label, required this.onPressed});

  final String label;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: ColorsManager.brown,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
             borderSide: BorderSide.none,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
          child: Text(
            label,
            style: TextStyleManager.textStyleSemiBold.copyWith(
                fontSize: 24,
                color: ColorsManager.white
            ),
          ),
        ),
      ),
    );
  }
}
