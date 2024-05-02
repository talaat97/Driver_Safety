import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/notifaction_page_builder.dart';

import 'package:flutter/material.dart';
class NotifactionPage extends StatelessWidget {
  const NotifactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultHomeView(widget:NotifactionPageBuilder());
  }
}
