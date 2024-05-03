import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/delay_manager.dart';
import 'package:driver_safety/core/resources_manager/size_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:driver_safety/features/auth/presentation/views/forget_password_view.dart';
import 'package:driver_safety/features/auth/presentation/views/sign_in_view.dart';
import 'package:driver_safety/features/auth/presentation/views/sign_up_view.dart';
import 'package:driver_safety/features/auth/presentation/views/widgets/google_button.dart';
import 'package:driver_safety/features/home/presentation/view/home_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/shared_widgets/form/form_item_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInViewBuilder extends StatefulWidget {
  const SignInViewBuilder({super.key});

  @override
  State<SignInViewBuilder> createState() => _SignInViewBuilderState();
}

class _SignInViewBuilderState extends State<SignInViewBuilder> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    bool isUserValid = false;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'sign in',
              style: TextStyleManager.textStyleSemiBold
                  .copyWith(color: ColorsManager.primary, fontSize: 36),
            ),
            const SizedBox(
              height: SizeManager.spaceBetweenForm * 2,
            ),
            FormItemBuilder(
                prefix: SvgPicture.asset(AssetsManager.phone),
                label: 'Phone number',
                isRequired: true,
                controller: _phoneController,
                textInputType: TextInputType.phone),
            const SizedBox(
              height: SizeManager.spaceBetweenForm,
            ),
            FormItemBuilder(
                prefix: SvgPicture.asset(AssetsManager.email),
                label: 'Password',
                isRequired: true,
                controller: _passwordController,
                textInputType: TextInputType.visiblePassword),
            const SizedBox(
              height: SizeManager.spaceBetweenForm - 2,
            ),
            InkWell(
              onTap: () {
                Get.to(const ForgetPasswordView(),
                    transition: DelayManager.transitionRightToLeft,
                    duration: const Duration(milliseconds: 500));
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forget Password?',
                  style: TextStyleManager.textStyleBold.copyWith(
                      fontSize: 16,
                      color: ColorsManager.primary,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            const SizedBox(
              height: SizeManager.spaceBetweenForm - 2,
            ),
            FormButton(
                label: 'Sign in',
                onPressed: () async {
                  try {
                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _phoneController.text,
                      password: _passwordController.text,
                    );

                    //await FirebaseAuth.instance.currentUser!.sendEmailVerification();
                    print('test in sign in');
                    print(_phoneController.text);
                    print(_passwordController.text);
                    FirebaseAuth.instance.currentUser!.emailVerified
                        ? Get.to(const HomePageView())
                        : Get.to(DefaultHomeView(
                            widget: AppBar(
                              title: FirebaseAuth
                                      .instance.currentUser!.emailVerified
                                  ? Text('Welcome to home page')
                                  : Text('we are waiting to vafiy'),
                              actions: [
                                IconButton(
                                    onPressed: () async {
                                      print(isUserValid);
                                      FirebaseAuth.instance.currentUser!
                                          .sendEmailVerification();
                                      setState(() async {
                                        isUserValid = await FirebaseAuth
                                            .instance
                                            .currentUser!
                                            .emailVerified;
                                      });
                                    },
                                    icon: const Icon(Icons.refresh))
                              ],
                              leading: IconButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut();
                                    Get.off(SignInView());
                                  },
                                  icon: const Icon(Icons.arrow_back_outlined)),
                            ),
                          ));
                  } on FirebaseAuthException catch (e) {
                    print(e.toString());
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                }),
            const SizedBox(
              height: SizeManager.spaceBetweenForm - 2,
            ),
            GoogleButton(
                label: 'Sign in With Google',
                onPressed: () {
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
                    Get.to(const SignUpView(),
                        transition: DelayManager.transitionRightToLeft,
                        duration: const Duration(milliseconds: 500));
                  },
                  child: Text(
                    'Sign up',
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
    );
  }
}

Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  if (googleUser == null) {
    return;
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential);
  Get.off(
    DefaultHomeView(
      widget: AppBar(
        title: FirebaseAuth.instance.currentUser!.emailVerified
            ? Text('Welcome to home page')
            : Text('we are waiting to vafiy'),
        actions: [
          IconButton(
              onPressed: () {
                Get.off(SignInView());
              },
              icon: const Icon(Icons.arrow_back_outlined))
        ],
      ),
    ),
  );
}
