import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/delay_manager.dart';
import 'package:driver_safety/core/resources_manager/size_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:driver_safety/core/shared_widgets/my_snack_bar.dart';
import 'package:driver_safety/features/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:driver_safety/features/auth/presentation/cubit/sign_in_cubit/sign_in_states.dart';
import 'package:driver_safety/features/auth/presentation/views/forget_password_view.dart';
import 'package:driver_safety/features/auth/presentation/views/sign_in_view.dart';
import 'package:driver_safety/features/auth/presentation/views/sign_up_view.dart';
import 'package:driver_safety/features/auth/presentation/views/widgets/google_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isUserValid = false;

  var formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) 
      {
        if(state is SignInErrorState)
        {
          callMySnackBar(context: context, text: state.error);
        }
      },
      builder: (context, state) => Padding(
      padding: const EdgeInsets.symmetric(horizontal:  30.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 30.0,),
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
                  controller: phoneController,
                  textInputType: TextInputType.phone),
              const SizedBox(
                height: SizeManager.spaceBetweenForm,
              ),
              FormItemBuilder(
                  prefix: SvgPicture.asset(AssetsManager.email),
                  label: 'Password',
                  isRequired: true,
                  controller: passwordController,
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
              state is SignInLoadingState?
              const CircularProgressIndicator():
              FormButton(
                  label: 'Sign in',
                  onPressed: ()  {
                    if(formKey.currentState!.validate()){
                  SignInCubit.get(context).signIn(
                    emailOrPhone: phoneController.text, 
                    password: passwordController.text);
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
              const SizedBox(height: 30.0,)
            ],
          ),
        ),
      ),
    ));
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
