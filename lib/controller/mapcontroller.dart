import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapcontroller extends GetxController {
  GoogleMapController? mapController;
  Position? currentPosition;
  String? address;
  TextEditingController housecontroller = TextEditingController();
  TextEditingController landmarkcontroller = TextEditingController();
  TextEditingController placenamecontroller = TextEditingController();
  String street = '';
  String locality = '';
  String country = '';
  String postalcode = '';
  String placename = '';
  String state = '';

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      currentPosition = position;
      update();
      // ignore: empty_catches
    } catch (e) {}
  }

  getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];

      street = place.street!;
      //  housecontroller.text = place.street!.toString();
      locality = place.locality!;
      country = place.country!;
      postalcode = place.postalCode!;
      placename = place.name!;
      state = place.administrativeArea!;
      // landmarkcontroller.text = place.subThoroughfare!;
      // placenamecontroller.text = place.name!;
      //log('${place.street}, ${place.postalCode}, ${place.locality}, ${place.name}, ${place.administrativeArea}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.subThoroughfare}, ${place.thoroughfare}');
      update();

      String address =
          '${place.street}, ${place.postalCode}, ${place.locality}, ${place.country}';

      return address;
    } catch (e) {
      //log(e.toString());
      return '';
    }
  }

  void getAddress() async {
    String address = await getAddressFromCoordinates(
        currentPosition!.latitude, currentPosition!.longitude);

    this.address = address;
    update();
    // log(address);
  }

  @override
  void onInit() {
    Geolocator.requestPermission();

    getCurrentLocation();
    getAddress();
    super.onInit();
  }
}
