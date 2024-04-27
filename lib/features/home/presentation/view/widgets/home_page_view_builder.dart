import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/features/home/presentation/view/get_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class HomePageViewBuilder extends StatelessWidget {
  const HomePageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Drive safety',
            style: TextStyleManager.textStyleBold
                .copyWith(color: ColorsManager.white, fontSize: 24)),
        const SizedBox(height: 200),
        Text(
          'Welcome',
          style: TextStyleManager.textStyleRegular.copyWith(
              color: ColorsManager.black,
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 112),
        Text(
          textAlign: TextAlign.center,
          "So that we can help you,please specify your",
          style: TextStyleManager.textStyleRegular
              .copyWith(color: ColorsManager.black, fontSize: 32),
        ),
        InkWell(
          onTap: () {
            _getCuruntLocation();
            Get.to(const GetLocation());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'current location',
                style: TextStyleManager.textStyleRegular
                    .copyWith(color: ColorsManager.primary, fontSize: 32),
              ),
              const Icon(Icons.location_on_rounded, size: 40),
            ],
          ),
        ),
      ],
    );
  }
}

_getCuruntLocation() async {
  Location location = Location();

  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  locationData = await location.getLocation();
  print(locationData.latitude);
  print(locationData.longitude);
}
