import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/features/auth/presentation/views/sign_in_view.dart';
import 'package:driver_safety/features/home/presentation/cubit/contacts_cubit/contacts_cubit.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:driver_safety/features/profile/presentation/views/your_profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileViewBuilderBody extends StatelessWidget {
  const ProfileViewBuilderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: 
      [
        ProfileViewBuilderBodyBuilder(
          icon: Icons.person_2_outlined,
          title: 'Your Profile',
          onTab: ()
          {
            Get.to(()=>const YourProfileView());
          }
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          child: Divider(),
        ),
        ProfileViewBuilderBodyBuilder(
          icon: Icons.logout,
          title: 'Log out',
          onTab: () async
          {
            await FirebaseAuth.instance.signOut();
            ContactsCubit.get(context).firstContact=null;
            ContactsCubit.get(context).secondContact=null;
            HomeCubit.get(context).userModel = null;
            Get.off(const SignInView());
          }
        ),
      ],
    );
  }
}

class ProfileViewBuilderBodyBuilder extends StatelessWidget {
  const ProfileViewBuilderBodyBuilder({super.key, required this.icon, required this.title, required this.onTab, });
  
  final IconData icon;
  
  final String title;
  
  final void Function() onTab ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      child: InkWell(
        onTap: onTab,
        child: Row(
          children: 
          [
            Icon(icon, size: 35),
            const SizedBox(width: 15,),
            Text(title, style: TextStyleManager.textStyleSemiBold.copyWith(
              fontSize: 24
            ),),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right, size: 30,)
          ],
        ),
      ),
    );
  }
}