import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/size_manager.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_item_builder.dart';
import 'package:driver_safety/core/shared_widgets/my_snack_bar.dart';
import 'package:driver_safety/features/auth/data/models/user_model.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:driver_safety/features/profile/presentation/profile_update_cubit/profile_update_cubit.dart';
import 'package:driver_safety/features/profile/presentation/profile_update_cubit/profile_update_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class YourProfileViewBody extends StatelessWidget {
  YourProfileViewBody({super.key});


  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: SingleChildScrollView(
         
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children : 
          [
                  BlocConsumer<HomeCubit, HomeStates>(
                    listener: (context, state)
                    {
                    },
                    builder: (context, state)
                    { 
                      if(HomeCubit.get(context).userModel!=null)
                      {
                        nameController.text = HomeCubit.get(context).userModel!.name!;
                        phoneController.text = HomeCubit.get(context).userModel!.phone!;
                        emailController.text = HomeCubit.get(context).userModel!.email!;
                        return Form(
                        key: formKey,
                        child: Column(
                          children: [
                            FormItemBuilder(
                                prefix: SvgPicture.asset(AssetsManager.name),
                                label: 'Name',
                                isRequired: true,
                                controller: nameController,
                                textInputType: TextInputType.visiblePassword),
                            const SizedBox(
                              height: SizeManager.spaceBetweenForm,
                            ),
                            FormItemBuilder(
                                prefix: SvgPicture.asset(AssetsManager.phone),
                                label: 'Phone number',
                                isRequired: true,
                                controller: phoneController,
                                textInputType: TextInputType.visiblePassword),
                            const SizedBox(
                              height: SizeManager.spaceBetweenForm,
                            ),
                            FormItemBuilder(
                              enabled: false,
                                prefix: SvgPicture.asset(AssetsManager.email),
                                label: 'Email',
                                isRequired: true,
                                controller: emailController,
                                textInputType: TextInputType.visiblePassword),
                            const SizedBox(
                              height: SizeManager.spaceBetweenForm,
                            ),
                             SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                             BlocConsumer<ProfileUpdateCubit, ProfileUpdateStates>(
                              listener: (context, state)
                              {
                                if(state is ProfileUpdateSuccessState)
                                {
                                  HomeCubit.get(context).assignUser(userModel: state.userModel);
                                  callMySnackBar(context: context, text: 'Updated Successfully');
                                }
                                else if(state is ProfileUpdateErrorState)
                                {
                                  callMySnackBar(context: context, text: state.error);
                                }
                              },
                              builder: (context, state) {
                                return state is ProfileUpdateLoadingState?
                             const CircularProgressIndicator():
                            FormButton(
                              label: 'Update Profile',
                              onPressed: () async {
                              if(formKey.currentState!.validate())
                              {
                                ProfileUpdateCubit.get(context).updateUser(
                                  userModel: UserModel(
                                    phone: phoneController.text, 
                                    name: nameController.text,
                                    email: emailController.text,
                                  )
                                );
                              }
                              });
                       
                             })
                             
                             ],
                        )
                      );
                      }
                      else if(state is HomeGetUserFromCloudLoadingState)
                      {
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      else if (state is HomeUserFromCloudErrorState)
                      {
                        return Center(child: Text(state.error),);
                      }
                      else
                      {
                        return const SizedBox();
                      }
                    }
                  ),
                 
                  
          ],
        ),
      ),);
  }
}

