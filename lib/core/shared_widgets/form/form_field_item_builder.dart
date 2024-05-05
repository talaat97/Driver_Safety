 import 'package:flutter/material.dart';

import '../../resources_manager/color_manager.dart';
import '../../resources_manager/size_manager.dart';
import '../../resources_manager/style_manager.dart';

class FormFieldItemBuilder extends StatelessWidget {
  const FormFieldItemBuilder({
    super.key,
    required this.isRequired,
    required this.label,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.onChange,
    this.prefix,
    this.suffix,
    this.enabled =true,
  });

  final bool isRequired;
  final bool enabled;
  final void Function(String)? onChange;
  final Widget? suffix;
  final Widget? prefix;
  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;
  final double borderRadius = SizeManager.formFieldRadiusSize;


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: ColorsManager.primary,
      ),
      child: TextFormField(
        enabled: enabled,
        validator: (value) {
          if(!isRequired) return null;
          if (value!.isEmpty) {
            return 'You must fill this field ';
          }
          return null;
        },
        keyboardType: textInputType,
        controller: controller,
        onChanged: onChange,
        style: TextStyleManager.textStyleMedium.copyWith(
          fontSize: SizeManager.formFieldFontSize,
          color: ColorsManager.black,
        ),
        cursorColor: ColorsManager.primary,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 15,right: 9,top: 8,bottom: 8),
            child: prefix,
          ),
          suffixIcon: suffix,
          hintText: label,
          hintStyle: TextStyleManager.textStyleMedium.copyWith(
            fontSize: SizeManager.formFieldFontSize,
            color: ColorsManager.grey,
          ),
          errorStyle: TextStyleManager.textStyleMedium.copyWith(
            fontSize: SizeManager.formFieldFontSize,
            color: ColorsManager.primary,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: ColorsManager.grey,
            )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: ColorsManager.grey,
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
                color: ColorsManager.primary,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: ColorsManager.primary,
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: ColorsManager.primary,
            )
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8)
        ),
      ),
    );
  }
}