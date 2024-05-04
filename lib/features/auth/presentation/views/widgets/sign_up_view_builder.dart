
import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/size_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/back_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_item_builder.dart';
import 'package:driver_safety/core/shared_widgets/my_snack_bar.dart';
import 'package:driver_safety/features/auth/data/models/user_model.dart';
import 'package:driver_safety/features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:driver_safety/features/auth/presentation/cubit/sign_up_cubit/sign_up_states.dart';
import 'package:driver_safety/features/auth/presentation/views/widgets/google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpViewBuilder extends StatelessWidget {
  SignUpViewBuilder({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state)
      {
        if(state is SignUpErrorState)
        {
          callMySnackBar(context: context, text: state.error);
        }
        else if(state is SignUpSuccessState)
        {
          callMySnackBar(context: context, text: state.msg);
          Navigator.pop(context);
        }
      },
      builder: (context, state)=> Column(
      children: [
        const DefaultBackButton(),
        const SizedBox(height: 50,),
        Text(
          'Sign up',
          style: TextStyleManager.textStyleBold
              .copyWith(color: ColorsManager.primary, fontSize: 36),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, 
            //top: 50
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
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
                        prefix: SvgPicture.asset(AssetsManager.phone,),
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
                    state is SignUpLoadingState?
                    const CircularProgressIndicator():
                    FormButton(
                        label: 'Sign up',
                        onPressed: () async {
                          if(formKey.currentState!.validate())
                          {
                            SignUpCubit.get(context).signUp(
                              userModel: UserModel(
                                phone: _phoneController.text,
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text
                              )
                            );
                          }
                        }),
                    const SizedBox(
                      height: SizeManager.spaceBetweenForm - 2,
                    ),
                    GoogleButton(label: 'Sign up With Google', onPressed: () {}),
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
            ),
          ),
        ),
      ],
    )
  );
  }
}
