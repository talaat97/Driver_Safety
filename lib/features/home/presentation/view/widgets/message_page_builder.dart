import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/form/form_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagaPageBuilder extends StatelessWidget {
  const MessagaPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 50, top: 60, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome',
              style: TextStyleManager.textStyleRegular.copyWith(
                  color: ColorsManager.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'To First contact ',
                style: TextStyleManager.textStyleRegular.copyWith(
                    color: ColorsManager.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Be here to help me if I need you',
                          style: TextStyleManager.textStyleRegular.copyWith(
                              color: ColorsManager.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.send,
                      size: 30,
                    ),
                  ],
                ),
              ),
             const SizedBox(height:60 ),
              Text(
                'To Second contact',
                style: TextStyleManager.textStyleRegular.copyWith(
                    color: ColorsManager.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                padding:
                const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Be here to help me if I need you',
                          style: TextStyleManager.textStyleRegular.copyWith(
                              color: ColorsManager.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.send,
                      size: 30,
                    ),
                  ],
                ),
              ),

            ],
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child:
            FormButton(
              label: 'continue',
              onPressed: () {
                Get.back();
              },
            ),

          ),
        ],
      ),
    );
  }
}
