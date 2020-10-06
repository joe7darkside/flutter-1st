import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/maps/kiosks_map_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'kiosks_map_data.dart';

import 'package:myapp/main.dart';

class KioskMap extends StatefulWidget {
  KioskMap({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _KioskMapState createState() => _KioskMapState();
}

class _KioskMapState extends State<KioskMap> {
  final kiosksMapDataStream = getIt.get<KiosksMapDataStream>();
  final LatLng _center = const LatLng(33.307298, 44.482354);

  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();

  BitmapDescriptor pinLocationIcon;
  BitmapDescriptor myLocationIcon;
  List<Marker> allMarkers = [];
  List<Circle> allCircles = [];

  LocationData currentLocation;

  getLocation() async {
    print('getLocation');
    var location = new Location();
    location.onLocationChanged.listen((currentLocation) {
      var k = this.kiosksMapDataStream.getData;
      k.myLocation =
          LatLng(currentLocation.latitude, currentLocation.longitude);
      this.kiosksMapDataStream.setData(k);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    controller.setMapStyle(Utils.mapStyles);
    _controller.complete(controller);
    setState(() {
      allMarkers.add(Marker(
          markerId: MarkerId('baka'),
          draggable: false,
          icon: pinLocationIcon,
          onTap: () {
            print('baka');
          },
          position: LatLng(33.307298, 44.482354)));

      allMarkers.add(Marker(
          markerId: MarkerId('baka2'),
          draggable: false,
          icon: pinLocationIcon,
          onTap: () {
            print('baka2');
          },
          position: LatLng(33.289246, 44.397643)));
    });
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/marker2.png');
    myLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/marker3.png');
  }

  @override
  void initState() {
    super.initState();
    setCustomMapPin();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder(
          stream: kiosksMapDataStream.stream,
          builder: (BuildContext context, AsyncSnapshot snap) {
            KiosksMapData snapData = snap.data;

            // this.allMarkers.add(Marker(
            //         infoWindow: InfoWindow(title: 'baka'),
            //         markerId: MarkerId('me'),
            //         draggable: false,
            //         anchor: Offset(0.5, 0.5),
            //         icon: myLocationIcon,
            //         onTap: () {
            //           print('me');
            //         },
            //         zIndex: -1,
            //         position: (snapData == null) ? null : snapData.myLocation));



                    
            return GoogleMap(
              myLocationEnabled: false,
              compassEnabled: true,
              markers: Set.from(this.allMarkers),
              circles: {
                Circle(
                    circleId: CircleId('home'),
                    radius: 25,
                    strokeWidth: 0,
                    zIndex: 4,
                    strokeColor: Colors.blue,
                    center: (snapData == null) ? null : snapData.myLocation,
                    onTap: () { 
                      print('me');
                    },
                    fillColor: Colors.blue.withAlpha(70))
              },
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: (snapData == null) ? null : snapData.myLocation,
                zoom: 16.0,
              ),
            );
          },
        ));
  }
}
