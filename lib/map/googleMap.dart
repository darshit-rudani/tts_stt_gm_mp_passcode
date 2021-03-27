import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Googlemap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.home,
            size: 40.0,
          ),
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text(
            'Google Map',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
          ),
        ),
      ),
      body: new FlutterMap(
        options: new MapOptions(
            center: new LatLng(34.056340, -118.232050), zoom: 13.0),
        layers: [
          new TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/v4/"
                "{z}/{x}/{y}@2x.png?access_token={sk.eyJ1IjoiZHJva2UxMTEiLCJhIjoiY2ttcm9tZHZjMDNrODJ4bXdjeTkwdWh3eiJ9.oJev5ytVKHgDToUp5USxwQ}",
            additionalOptions: {
              'accessToken':
                  'sk.eyJ1IjoiZHJva2UxMTEiLCJhIjoiY2ttcm9tZHZjMDNrODJ4bXdjeTkwdWh3eiJ9.oJev5ytVKHgDToUp5USxwQ',
              'id': 'mapbox.streets',
            },
          ),
          MarkerLayerOptions(markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(34.056340, -118.232050),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: Icon(Icons.add_location_alt),
                  color: Color(0xff6200ee),
                  iconSize: 45.0,
                  onPressed: () {},
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
