import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/size_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:driver_safety/core/shared_widgets/form/form_item_builder.dart';
import 'package:driver_safety/core/shared_widgets/my_snack_bar.dart';
import 'package:driver_safety/features/auth/data/models/user_model.dart';
import 'package:driver_safety/features/home/presentation/cubit/contacts_cubit/contacts_cubit.dart';
import 'package:driver_safety/features/home/presentation/cubit/contacts_cubit/contacts_states.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagaPageBuilder extends StatelessWidget {
  MessagaPageBuilder({super.key});

  final TextEditingController msg1 = TextEditingController();
  final TextEditingController msg2 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 50, top: 40, bottom: 10),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Messages',
              style: TextStyleManager.textStyleRegular.copyWith(
                  color: ColorsManager.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 50),
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
                } else 
                {
                  msg1.text = HomeCubit.get(context).userModel!.firstContactModel != null?
                  HomeCubit.get(context).userModel!.firstContactModel!.msgTo! : '';
                  msg2.text = HomeCubit.get(context).userModel!.secondContactModel != null?
                  HomeCubit.get(context).userModel!.secondContactModel!.msgTo!:'';
                  return Expanded(
                    child: Form(
                      key: formKey,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              FormItemBuilder(
                                  isBig: true,
                                  label: 'To First Contact',
                                  hint: 'Enter Message for him/her',
                                  isRequired: true,
                                  controller: msg1,
                                  suffix: const Icon(
                                    Icons.send,
                                    color: ColorsManager.primary,
                                  ),
                                  textInputType: TextInputType.text),
                              const SizedBox(
                                height: SizeManager.spaceBetweenForm * 3,
                              ),
                              FormItemBuilder(
                                  isBig: true,
                                  label: 'To Second Contact',
                                  hint: 'Enter Message for him/her',
                                  isRequired: true,
                                  controller: msg2,
                                  suffix: const Icon(
                                    Icons.send,
                                    color: ColorsManager.primary,
                                  ),
                                  textInputType: TextInputType.text),
                              const SizedBox(height: 50),
                              BlocConsumer<ContactsCubit, ContactsStates>(
                                  listener: (context, state) {
                                if (state is ContactsUpdateSuccessState) {
                                  UserModel userModel =
                                      HomeCubit.get(context).userModel!;
                                  userModel.firstContactModel =
                                      state.firstContactModel;
                                  userModel.secondContactModel =
                                      state.secondContactModel;
                                  HomeCubit.get(context)
                                      .assignUser(userModel: userModel);
                                  callMySnackBar(
                                      context: context,
                                      text: 'Updated Successfully');
                                } else if (state is ContactsUpdateErrorState) {
                                  callMySnackBar(
                                      context: context, text: state.error);
                                }
                              }, builder: (context, state) {
                                if (state is ContactsUpdateLoadingState) {
                                  return const CircularProgressIndicator();
                                } else {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: FormButton(
                                      label: 'Done',
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          ContactsCubit.get(context)
                                              .updateContact(
                                                  firstContactMsg: msg1.text,
                                                  secondContactMsg: msg2.text,
                                                  userModel:
                                                      HomeCubit.get(context)
                                                          .userModel!);
                                        }
                                      },
                                    ),
                                  );
                                }
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                                 
                }
              })
        ],
      ),
    );
  }
}
