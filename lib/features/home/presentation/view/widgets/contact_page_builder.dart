import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:driver_safety/features/home/presentation/view/edit_of_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ContactPageBuilder extends StatelessWidget {
  const ContactPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Driver Safety ',
              style: TextStyleManager.textStyleRegular.copyWith(
                color: ColorsManager.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
        const SizedBox(height: 300),
        BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            
          },
          builder: (context, state) 
          {
            
            if(state is HomeGetUserFromCloudLoadingState)
            {
              return const Center(child: CircularProgressIndicator(),);
            }
            else if (state is HomeUserFromCloudErrorState)
            {
              return Center(child: Text(state.error),);
            }
            else
            {
              return Column(
                children: 
                [
                  ContactItemBuilder(
                    name: HomeCubit.get(context).userModel!.firstContactModel!=null ?
                    HomeCubit.get(context).userModel!.firstContactModel!.name! :'First contact Name'
                  ),
                  const SizedBox(height: 23),
                  ContactItemBuilder(
                    name: HomeCubit.get(context).userModel!.secondContactModel !=null ?
                    HomeCubit.get(context).userModel!.secondContactModel!.name! : 'Second contact name'
                  ),
                ],
              );
            }
          }
        ),
        
      ],
    );
  }
}

class ContactItemBuilder extends StatelessWidget {
  const ContactItemBuilder({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    name,
                    style: TextStyleManager.textStyleRegular.copyWith(
                      color: ColorsManager.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(const EditOfContact());
                    },
                    child: Text(
                      'Change',
                      style: TextStyleManager.textStyleRegular.copyWith(
                        color: ColorsManager.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
