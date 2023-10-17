import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noduster/const/color.dart';
import 'package:noduster/const/const.dart';
import 'package:noduster/controller/mapcontroller.dart';
import 'package:noduster/screens/numberofvehicles/textfieldwidget.dart';
import 'package:noduster/screens/payment_screen/payment_screen.dart';

class MapScreen extends StatefulWidget {
  MapScreen(
      {super.key,
      required this.totalprice,
      required this.service,
      required this.quantity,
      required this.rate,
      required this.mainservice,
      required this.bikeorcar});
  final String rate;
  final String totalprice;
  final String service;
  final String quantity;
  final String mainservice;
  final String bikeorcar;
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Position? _currentPosition;
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Random random = Random();

  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();

    _getCurrentLocation();
    _getAddress();
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];

      setState(() {
        street = place.street!;
        //  housecontroller.text = place.street!.toString();
        locality = place.locality!;
        country = place.country!;
        postalcode = place.postalCode!;
        placename = place.name!;
        state = place.administrativeArea!;
        // landmarkcontroller.text = place.subThoroughfare!;
        // placenamecontroller.text = place.name!;
      });
      //log('${place.street}, ${place.postalCode}, ${place.locality}, ${place.name}, ${place.administrativeArea}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.subThoroughfare}, ${place.thoroughfare}');
      String address =
          '${place.street}, ${place.postalCode}, ${place.locality}, ${place.country}';

      return address;
    } catch (e) {
      //log(e.toString());
      return '';
    }
  }

  void _getAddress() async {
    String address = await getAddressFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude);
    setState(() {
      this.address = address;
    });
    // log(address);
  }

  final Mapcontroller _mapcontroller = Get.put(Mapcontroller());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _getAddress();
    });

    LatLng initialCameraPosition = LatLng(
      _mapcontroller.currentPosition?.latitude ?? 12.9716,
      _mapcontroller.currentPosition?.longitude ?? 77.5946,
    );

    return Scaffold(
      appBar: AppBar(
          title: const Text("Enter Your Address Details"),
          centerTitle: true,
          backgroundColor: kappbarcolor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          )),
      body: SafeArea(
        child: _currentPosition == null
            ? const Center(
                child: SpinKitFadingCircle(
                  color: kblue,
                  size: 70.0,
                ),
              )
            : GoogleMap(
                mapType: MapType.normal,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: initialCameraPosition,
                  zoom: 20.0,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('marker_1'),
                    position: initialCameraPosition,
                    infoWindow: const InfoWindow(
                      title: 'Current Location',
                    ),
                  ),
                },
                myLocationEnabled: true,
              ),
      ),
      floatingActionButton: _currentPosition == null
          ? const SizedBox(
              height: 10,
            )
          : FloatingActionButton.extended(
              backgroundColor: kappbarcolor,
              onPressed: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 230,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        kheight20,
                                        Text(
                                          street,
                                          style: const TextStyle(
                                            fontFamily: "poppinz",
                                            fontSize: 12,
                                            color: kblackcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: street.length,
                                          overflow: TextOverflow.clip,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '$placename, $locality, $state',
                                          style: const TextStyle(
                                            fontFamily: "poppinz",
                                            fontSize: 12,
                                            color: kgreycolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 3,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "$postalcode, $country",
                                          style: const TextStyle(
                                            fontFamily: "poppinz",
                                            fontSize: 12,
                                            color: kgreycolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: kgreycolor,
                                thickness: 1,
                              ),
                              kheight20,
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextfieldWidget(
                                      controller: housecontroller,
                                      hinttext: 'House/Flat Number',
                                      enabled: true,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter the house/flat number';
                                        }
                                        return null;
                                      },
                                    ),
                                    kheight20,
                                    TextfieldWidget(
                                      controller: landmarkcontroller,
                                      enabled: true,
                                      hinttext: 'Landmark',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter the landmark';
                                        }
                                        return null;
                                      },
                                    ),
                                    kheight20,
                                    TextfieldWidget(
                                      controller: placenamecontroller,
                                      enabled: true,
                                      hinttext: 'Name',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter the name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              kheight20,
                              kheight30,
                              SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(2),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        kappbarcolor,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Get.to(() => PaymentScreen(
                                              randomnum: random
                                                  .nextInt(200000)
                                                  .toString(),
                                              mainservice: widget.mainservice,
                                              contactname:
                                                  placenamecontroller.text,
                                              flatno: housecontroller.text,
                                              landmark: landmarkcontroller.text,
                                              address: address!,
                                              orderquantity: widget.quantity,
                                              price: widget.rate,
                                              servicename: widget.service,
                                              totalprice: widget.totalprice,
                                              bikeorcar: widget.bikeorcar,
                                            ));
                                      }
                                    },
                                    child: const Text(
                                      'Add Address and Slot',
                                      style: TextStyle(
                                        fontFamily: "poppinz",
                                        fontSize: 20,
                                        color: kwhitecolor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                              kheight20
                            ],
                          ),
                        ),
                      );
                    });
              },
              label: const Text('Add Address'),
              icon: const Icon(Icons.location_on_sharp)),
    );
  }
}
