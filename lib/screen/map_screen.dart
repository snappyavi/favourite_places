import 'package:flutter/material.dart';
import 'package:udemy_favourite_places/models/place_model.dart';

class MapScreen extends StatefulWidget {
  //default value
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 37.422,
      longitude: -122.084,
      address: '',
    ),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isSelecting ? "Pick your location" : "Your location",
        ),
        actions: [
          if (widget.isSelecting)
            IconButton(onPressed: () {}, icon: Icon(Icons.save)),
        ],
      ),
      // body: MapplsMap(
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(widget.location.latitude, widget.location.latitude),
      //     zoom: 16,
      //   ),
      //   zoomGesturesEnabled: true,
      //   doubleClickZoomEnabled: true,
      //   scrollGesturesEnabled: true,
      //   myLocationEnabled: true,
      // ),
    );
  }
}
