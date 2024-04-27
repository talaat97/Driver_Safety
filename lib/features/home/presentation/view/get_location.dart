import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/get_location_builder.dart';
import 'package:flutter/cupertino.dart';

class GetLocation extends StatelessWidget {
  const GetLocation({super.key});



  @override
  Widget build(BuildContext context) {
    return const DefaultHomeView(widget: GetLocationBuilder() );
  }
}
