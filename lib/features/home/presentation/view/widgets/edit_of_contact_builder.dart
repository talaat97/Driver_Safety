import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/size_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/back_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_item_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditOfContactBuilder extends StatelessWidget {
  EditOfContactBuilder({super.key});

  final TextEditingController _nameController1 = TextEditingController();
  final TextEditingController _phoneController1 = TextEditingController();
  final TextEditingController _nameController2 = TextEditingController();
  final TextEditingController _phoneController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DefaultBackButton(),
                  const SizedBox(width: 27),
                  Text('Driver safety',
                      style: TextStyleManager.textStyleBold
                          .copyWith(color: ColorsManager.white, fontSize: 24)),
                ],
              ),
            ),
            const SizedBox(height: 100),
            FormItemBuilder(
                prefix: SvgPicture.asset(AssetsManager.name),
                label: 'Name',
                isRequired: true,
                controller: _nameController1,
                textInputType: TextInputType.visiblePassword),
            const SizedBox(
              height: SizeManager.spaceBetweenForm,
            ),
            FormItemBuilder(
                prefix: SvgPicture.asset(AssetsManager.phone),
                label: 'Phone number',
                isRequired: true,
                controller: _phoneController1,
                textInputType: TextInputType.visiblePassword),
            const SizedBox(
              height: SizeManager.spaceBetweenForm,
            ),
            FormItemBuilder(
                prefix: SvgPicture.asset(AssetsManager.name),
                label: 'Name',
                isRequired: true,
                controller: _nameController2,
                textInputType: TextInputType.visiblePassword),
            const SizedBox(
              height: SizeManager.spaceBetweenForm,
            ),
            FormItemBuilder(
                prefix: SvgPicture.asset(AssetsManager.name),
                label: 'Phone number',
                isRequired: true,
                controller: _phoneController2,
                textInputType: TextInputType.visiblePassword),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric( vertical: 30),
              child: FormButton(
                label: 'continue',
                onPressed: () {
                  Get.back();
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
