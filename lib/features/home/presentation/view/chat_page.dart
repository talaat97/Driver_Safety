import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/core/shared_widgets/back_button.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/chat_page_builder.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        toolbarHeight: 150,
        centerTitle: true,
        backgroundColor: ColorsManager.primary,
        leading: const DefaultBackButton(),
        title: Text(
          'First contact Name',
          style: TextStyleManager.textStyleRegular.copyWith(
            color: ColorsManager.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: const ChatPageBuilder(),
    );
  }
}
