import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:final_mae_3rd_wh/GoogleMap/constants.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(3.041803, 101.793075);
  static const LatLng destination = LatLng(3.01967, 101.762086);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRose);
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure);
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueBlue);

  void getCurrentLocation() async {
    Location location = Location();
    location.enableBackgroundMode(enable: true);

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      // StreamBuilder(stream: stream, builder: builder)
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();


    currentLocation = _locationData;


    print("THIS IS A TEST PRINT TO SHOW CURRENT LOCATION");
    print(currentLocation);


    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 13,
            target: LatLng(
              newLoc.latitude!,
              newLoc.longitude!,
            ),
          ),
        ),
      );
    });
    setState(() {});
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      setState((){});
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    // setCustomMarkerIcon();

    getPolyPoints();
    super.initState();
  }

  Future<void> _refresh() {
    return Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return

      SizedBox(height: 260, //CAN ADJUST THE SIZE
          child:
          Builder(builder: (context) {
            if (currentLocation == null) {
              CircularProgressIndicator();
              Future.delayed(Duration(seconds: 1));
              return Center(child: Text("Loading"));;
            }
            else {
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    zoom: 13.5),
                polylines: {
                  Polyline(
                    polylineId: PolylineId("route"),
                    points: polylineCoordinates,
                    color: primaryColor,
                    width: 6,
                  )
                },
                markers: {
                  Marker(
                    icon: currentLocationIcon,
                    markerId: MarkerId("currentLocation"),
                    position: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                  ),
                  Marker(
                    icon: sourceIcon,
                    markerId: MarkerId("source"),
                    position: sourceLocation,
                  ),
                  Marker(
                    icon: destinationIcon,
                    markerId: MarkerId("destination"),
                    position: destination,
                  ),
                },
                onMapCreated: (mapController) {
                  _controller.complete(mapController);
                },
              );
            }
          }
          )
      );
  }
}
