import 'package:favourite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 37.422,
      longitude: -122.084,
      address: "",
    ),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    final initialLatLng =
        LatLng(widget.location.latitude, widget.location.longitude);

    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? "Pick Your Location" : "Your Location"),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _pickedLocation == null
                  ? null
                  : () {
                      // Pass picked location back
                      Navigator.of(context).pop(_pickedLocation);
                    },
            ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: initialLatLng,
          initialZoom: 16,
          onTap: widget.isSelecting
              ? (tapPosition, point) {
                  _selectLocation(point);
                }
              : null,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://maps.geoapify.com/v1/tile/osm-bright/{z}/{x}/{y}.png?apiKey=d08ffd3cc1fc48e18d5b837dd138dac1',
            userAgentPackageName: 'com.example.favourite_places',
          ),
          MarkerLayer(
            markers: [
              if (_pickedLocation != null || !widget.isSelecting)
                Marker(
                  point: _pickedLocation ?? initialLatLng,
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Icons.location_on,
                    size: 40,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
