import 'package:driver_safety/core/shared_widgets/default_home_view.dart';
import 'package:driver_safety/features/home/presentation/view/widgets/get_location_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class GetLocation extends StatelessWidget {
  const GetLocation({super.key, required this.location});

  final LocationData? location;

  @override
  Widget build(BuildContext context) {
    return  DefaultHomeView( widget: GetLocationBuilder(location: location ));
  }
}
