// import 'dart:html';
import 'package:food_app/providers/checkout_provider.dart';
import 'package:location/location.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CustomGoogleMap extends StatefulWidget {
  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  LatLng _initialCameraPosition = LatLng(19.01961856504959, 72.8557544490993);

  late GoogleMapController controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _value) {
    controller = _value;
    _location.onLocationChanged.listen((event) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(event.latitude!, event.longitude!),
            zoom: 17,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialCameraPosition,
                ),
                mapType: MapType.satellite,
                onMapCreated: _onMapCreated,
                mapToolbarEnabled: true,
                myLocationEnabled: true,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    right: 60,
                    left: 10,
                    bottom: 40,
                    top: 40,
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      await _location.getLocation().then((value) {
                        setState(() {
                          checkoutProvider.setLocation = value;
                        });
                      });
                      Navigator.of(context).pop();
                    },
                    color: primaryColor,
                    child: Text("Set Location"),
                    shape: StadiumBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
