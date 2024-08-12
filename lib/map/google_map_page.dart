import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center =
      const LatLng(30.5876433, 31.4868128); // Your parking location coordinates

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(
        'https://www.google.com/maps/place/AlMejarra/@30.5876386,31.4867001,19z/data=!4m14!1m7!3m6!1s0x14f7f054c47e8509:0xceeef2c84c7f078b!2sAlMejarra!8m2!3d30.5876421!4d31.4874565!16s%2Fg%2F11clwn5hwl!3m5!1s0x14f7f054c47e8509:0xceeef2c84c7f078b!8m2!3d30.5876421!4d31.4874565!16s%2Fg%2F11clwn5hwl?entry=ttu');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mall Location',
          style: TextStyle(
              fontSize: 28,
              color: Color.fromRGBO(88, 80, 141, 1),
              fontFamily: 'Pacifico'),
        ),
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('parking'),
                  position: _center,
                  infoWindow: InfoWindow(
                    title: 'Smart Mall Location',
                  ),
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _launchURL,
              child: Text('Get Directions'),
            ),
          ),
        ],
      ),
    );
  }
}
