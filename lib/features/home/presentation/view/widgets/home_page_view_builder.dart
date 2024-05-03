import 'package:driver_safety/core/resources_manager/color_manager.dart';
import 'package:driver_safety/core/resources_manager/style_manager.dart';
import 'package:driver_safety/features/home/presentation/view/get_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageViewBuilder extends StatefulWidget {
  const HomePageViewBuilder({super.key});

  @override
  State<HomePageViewBuilder> createState() => _HomePageViewBuilderState();
}

class _HomePageViewBuilderState extends State<HomePageViewBuilder> {
  @override
  Widget build(BuildContext context) {
    bool _isgettingLocation = false;
    _getCurrentLocation() async {
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
      setState(() {
        _isgettingLocation = true;
      });
      locationData = await location.getLocation();
      final lat = locationData.latitude;
      final lng = locationData.longitude;

      if (lat == null || lng == null) {
        return;
      }

      print('test 01');
      print(lat);
      print(lng);
      String saberMapKey = "AIzaSyBWB1JR4gnnhypAmwDFckN0anoRUTH5SAY";
      var address;

      try {
        String googleMapsUrl =
            'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

        if (await canLaunch(googleMapsUrl)) {
          await launch(googleMapsUrl);
        } else {
          throw 'Could not launch $googleMapsUrl';
        }
      } catch (e) {
        print('test 03');
        print(e.toString());
      }

      return address;
    }

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
          onTap: () async {
            LocationData? userLocation = await _getCurrentLocation();
            print(userLocation);
            Get.to(GetLocation(location: userLocation));
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
