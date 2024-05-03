import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/size_manager.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class YourProfileViewBody extends StatelessWidget {
   YourProfileViewBody({super.key});

final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: 
        [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      FormItemBuilder(
                          prefix: SvgPicture.asset(AssetsManager.name),
                          label: 'Name',
                          isRequired: true,
                          controller: _nameController,
                          textInputType: TextInputType.visiblePassword),
                      const SizedBox(
                        height: SizeManager.spaceBetweenForm,
                      ),
                      FormItemBuilder(
                          prefix: SvgPicture.asset(AssetsManager.phone),
                          label: 'Phone number',
                          isRequired: true,
                          controller: _phoneController,
                          textInputType: TextInputType.visiblePassword),
                      const SizedBox(
                        height: SizeManager.spaceBetweenForm,
                      ),
                      FormItemBuilder(
                          prefix: SvgPicture.asset(AssetsManager.email),
                          label: 'Email',
                          isRequired: true,
                          controller: _emailController,
                          textInputType: TextInputType.visiblePassword),
                      const SizedBox(
                        height: SizeManager.spaceBetweenForm,
                      ),
                    ],
                  ),
                ),
                
                FormButton(
                    label: 'Update Profile',
                    onPressed: () async {
                     
                    }),
                
        ],
      ),);
  }
}

