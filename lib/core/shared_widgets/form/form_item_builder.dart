import 'package:flutter/material.dart';
import '../../resources_manager/size_manager.dart';
import 'form_field_item_builder.dart';
import 'form_label_item_builder.dart';

class FormItemBuilder extends StatelessWidget {
  const FormItemBuilder({
    super.key,
    required this.label,
    required this.isRequired,
    this.onChange,
    this.suffix,
    this.prefix,
    this.hint,
    this.enabled = true,
    this.isBig = false,
    required this.controller,
    required this.textInputType
  });

  final String label;
  final String? hint;
  final bool isRequired;
  final bool enabled;
  final bool isBig;
  final void Function(String)? onChange;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController controller;
  final TextInputType textInputType;
  final double borderRadius = SizeManager.formFieldRadiusSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabelItemBuilder(
          label: label,
          isRequired: isRequired
        ),
        const SizedBox(height: SizeManager.formItemSize),
        isBig?
        FormFieldBigItemBuilder(
          enabled: enabled,
          isRequired: isRequired,
          label:  hint ?? 'Enter your $label',
          controller: controller,
          textInputType: TextInputType.emailAddress,
          onChange: onChange,
          prefix: prefix,
          suffix: suffix,
        ):
        FormFieldItemBuilder(
          enabled: enabled,
          isRequired: isRequired,
          label:  hint ?? 'Enter your $label',
          controller: controller,
          textInputType: TextInputType.emailAddress,
          onChange: onChange,
          prefix: prefix,
          suffix: suffix,
        ),
      ],
    );
  }
}
