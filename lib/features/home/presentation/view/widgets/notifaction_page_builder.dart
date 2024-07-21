import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/features/home/data/model/contact_model.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:driver_safety/features/home/presentation/view/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class NotifactionPageBuilder extends StatelessWidget {
  const NotifactionPageBuilder({super.key});

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
        const SizedBox(height: 200),
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
              else if( HomeCubit.get(context).userModel!.firstContactModel==null&& HomeCubit.get(context).userModel!.secondContactModel==null )
              {
                return const Center(child: Text('No Contact added yet'));
              }
              else
              {
                return Column(
                  children:
                  [
                    NotificationItemBuilder(contactModel: HomeCubit.get(context).userModel!.firstContactModel!, order: 1),
                    const SizedBox(height: 60),
                    NotificationItemBuilder(contactModel: HomeCubit.get(context).userModel!.secondContactModel!, order: 2),

                  ],
                );
              }
            }
        ),

      ],
    );
  }
}

class NotificationItemBuilder extends StatelessWidget {
  const NotificationItemBuilder({super.key, required this.contactModel, required this.order});

  final int order;
  final ContactModel contactModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        Get.to(  ChatPage( contactModel : contactModel));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 35,
                  backgroundColor: ColorsManager.primary,
                  child: Text(
                    '$order',
                    style: TextStyleManager.textStyleRegular.copyWith(
                      color: ColorsManager.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contactModel.name!,
                        style: TextStyleManager.textStyleRegular.copyWith(
                          color: ColorsManager.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Sure , my love, ..... ',
                        style: TextStyleManager.textStyleRegular.copyWith(
                          color: ColorsManager.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '1 ',
                  style: TextStyleManager.textStyleRegular.copyWith(
                    color: ColorsManager.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
