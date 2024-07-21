import 'package:driver_safety/core/resources_manager/assets_manager.dart';
import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/size_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/back_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_item_builder.dart';
import 'package:driver_safety/features/home/data/model/contact_model.dart';
import 'package:driver_safety/features/home/presentation/cubit/contacts_cubit/contacts_cubit.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_nav_cubit/home_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditOfContactBuilder extends StatelessWidget {
  EditOfContactBuilder({super.key});

  final TextEditingController _nameController1 = TextEditingController();
  final TextEditingController _phoneController1 = TextEditingController();
  final TextEditingController _nameController2 = TextEditingController();
  final TextEditingController _phoneController2 = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const DefaultBackButton(),
              const SizedBox(width: 27),
              Text('Driver safety',
                  style: TextStyleManager.textStyleBold
                      .copyWith(color: ColorsManager.white, fontSize: 24)),
            ],
          ),
          BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HomeGetUserFromCloudLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeUserFromCloudErrorState) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                _nameController1.text = HomeCubit.get(context).userModel!.firstContactModel != null ?
                HomeCubit.get(context).userModel!.firstContactModel!.name! :'';
                _phoneController1.text = HomeCubit.get(context).userModel!.firstContactModel != null ?
                    HomeCubit.get(context).userModel!.firstContactModel!.phone!:'';
                _nameController2.text = HomeCubit.get(context).userModel!.secondContactModel != null ?
                    HomeCubit.get(context).userModel!.secondContactModel!.name!:'';
                _phoneController2.text = HomeCubit.get(context).userModel!.secondContactModel != null ?
                    HomeCubit.get(context).userModel!.secondContactModel!.phone!:'';
                
                return Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 100),
                            FormItemBuilder(
                                prefix: SvgPicture.asset(AssetsManager.name),
                                label: 'First Contact',
                                hint: 'Enter His/Her Name',
                                isRequired: true,
                                controller: _nameController1,
                                textInputType: TextInputType.visiblePassword),
                            const SizedBox(
                              height: SizeManager.spaceBetweenForm,
                            ),
                            FormItemBuilder(
                                prefix: SvgPicture.asset(AssetsManager.phone),
                                label: 'Phone number',
                                hint: 'Enter His/Her phone number',
                                isRequired: true,
                                controller: _phoneController1,
                                textInputType: TextInputType.visiblePassword),
                            const SizedBox(
                              height: SizeManager.spaceBetweenForm,
                            ),
                            FormItemBuilder(
                                prefix: SvgPicture.asset(AssetsManager.name),
                                label: 'Second Contact',
                                hint: 'Enter His/Her Name',
                                isRequired: true,
                                controller: _nameController2,
                                textInputType: TextInputType.visiblePassword),
                            const SizedBox(
                              height: SizeManager.spaceBetweenForm,
                            ),
                            FormItemBuilder(
                                prefix: SvgPicture.asset(AssetsManager.name),
                                label: 'Phone number',
                                hint: 'Enter His/Her phone number',
                                isRequired: true,
                                controller: _phoneController2,
                                textInputType: TextInputType.visiblePassword),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: FormButton(
                                label: 'continue',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    ContactsCubit.get(context).firstContact =
                                        ContactModel(
                                            phone: _phoneController1.text,
                                            name: _nameController1.text);
                                    ContactsCubit.get(context).secondContact =
                                        ContactModel(
                                            phone: _phoneController2.text,
                                            name: _nameController2.text);
                                    Get.back();
                                    HomeNavCubit.get(context)
                                        .changeIndex(newIndex: 3);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
