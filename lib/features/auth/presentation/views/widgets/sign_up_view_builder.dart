
import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/size_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/back_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_item_builder.dart';
import 'package:driver_safety/features/auth/presentation/views/sign_in_view.dart';
import 'package:driver_safety/features/auth/presentation/views/widgets/google_button.dart';
import 'package:driver_safety/features/auth/presentation/views/widgets/sign_In_view_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpViewBuilder extends StatelessWidget {
  SignUpViewBuilder({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const DefaultBackButton(),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Column(
              children: [
                Text(
                  'Sign up',
                  style: TextStyleManager.textStyleBold
                      .copyWith(color: ColorsManager.primary, fontSize: 36),
                ),
                const SizedBox(height: 60),
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
                FormItemBuilder(
                    prefix: SvgPicture.asset(AssetsManager.password),
                    label: 'Password',
                    isRequired: true,
                    controller: _passwordController,
                    textInputType: TextInputType.visiblePassword),
                const SizedBox(
                  height: SizeManager.spaceBetweenForm * 2,
                ),
                FormButton(
                    label: 'Sign up',
                    onPressed: () async {
                      print('test1');

                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        final User user = FirebaseAuth.instance.currentUser!;
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .set({
                          'email': _emailController.text,
                          'name': _nameController.text,
                          'phone':_phoneController.text,
                        });
                        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
                        Get.to( const SignInView());
                      } on FirebaseAuthException catch (e) {
                        print(e.toString());

                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    }),
                const SizedBox(
                  height: SizeManager.spaceBetweenForm - 2,
                ),
                GoogleButton(label: 'Sign up With Google', onPressed: () {
                  signInWithGoogle();
                }),
                const SizedBox(
                  height: SizeManager.spaceBetweenForm - 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don’t have an account?",
                      style: TextStyleManager.textStyleBold.copyWith(
                        color: ColorsManager.grey,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyleManager.textStyleBold.copyWith(
                          color: ColorsManager.primary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
