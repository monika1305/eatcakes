
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:html';
class CurrentLocationAppbar extends StatefulWidget {
  const CurrentLocationAppbar({Key? key}) : super(key: key);

  @override
  State<CurrentLocationAppbar> createState() => _CurrentLocationAppbarState();
}

class _CurrentLocationAppbarState extends State<CurrentLocationAppbar> {
   String? _address;

  @override
  void initState() {
    super.initState();
     _getGeoLocationPosition();
  }

  @override
  Widget build(BuildContext context) {

    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${_address}', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),),

          ],
        ),

    );
  }
  Future<String?> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){

      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location Services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = Geolocator.requestPermission() as LocationPermission;
      if(permission == LocationPermission.denied){
        return Future.error('Location permissions are denied');

      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _address = getAddressFromLatLong(position) as String?;
    return _address;

  }
  Future<String?> getAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    _address = '${place.street}, ${place.subLocality},'
        ' ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(()  {
    });
return _address;
  }


}
