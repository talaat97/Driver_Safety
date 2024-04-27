import 'package:flutter/material.dart';

import '../../resources_manager/color_manager.dart';
import '../../resources_manager/size_manager.dart';
import '../../resources_manager/style_manager.dart';

class FormLabelItemBuilder extends StatelessWidget {
  const FormLabelItemBuilder({
    super.key,
    required this.label,
    required this.isRequired
  });

  final String label;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyleManager.textStyleBold.copyWith(
        fontSize: SizeManager.formLabelSize,
        color: ColorsManager.primary,
      ),
    );
  }
}
