import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/features/home/presentation/view/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        const SizedBox(height: 300),
        InkWell(
          onTap: (){

            Get.to( const ChatPage());
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
                        '1',
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
                            'First Contact Name ',
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
        ),
        const SizedBox(height: 60),
        Padding(
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
                      '1',
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
                          'First Contact Name ',
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
      ],
    );
  }
}
