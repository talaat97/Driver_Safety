import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/size_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/back_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_item_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordViewBuilder extends StatelessWidget {
  const ForgetPasswordViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailOrPhoneController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const DefaultBackButton(),
              const SizedBox(
                width: 14,
              ),
              Text('Drive safety',
                  style: TextStyleManager.textStyleBold
                      .copyWith(color: ColorsManager.white, fontSize: 24)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AssetsManager.logo),
                const SizedBox(height: 10),
                Text('please enter your email to reset password',
                    textAlign: TextAlign.center,
                    style: TextStyleManager.textStyleRegular.copyWith(
                      color: ColorsManager.black,
                      fontSize: 31,
                    )),
                const SizedBox(
                  height: SizeManager.spaceBetweenForm * 2,
                ),
                FormItemBuilder(
                    prefix: SvgPicture.asset(AssetsManager.phone),
                    label: 'Email Or Phone number',
                    isRequired: true,
                    controller: _emailOrPhoneController,
                    textInputType: TextInputType.visiblePassword),
                const SizedBox(
                  height: SizeManager.spaceBetweenForm * 2,
                ),
                FormButton(
                  label: 'Reset',
                  onPressed: () async {
                    print(_emailOrPhoneController.text.contains('@'));
                    if (_emailOrPhoneController.text.contains('@') == false) {
                      final userEmailPyPhoneNumber = await FirebaseFirestore
                          .instance
                          .collection('users')
                          .doc(_emailOrPhoneController.text)
                          .get();
                      var userEmail = userEmailPyPhoneNumber.data()!['email'];
                      //print(userEmail);
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: userEmail);
                    } else {
                      FirebaseAuth.instance.sendPasswordResetEmail(
                          email: _emailOrPhoneController.text);
                      print(_emailOrPhoneController.text);
                    }

                    _emailOrPhoneController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
