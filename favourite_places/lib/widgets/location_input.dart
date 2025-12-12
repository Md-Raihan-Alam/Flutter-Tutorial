// location_input.dart

import 'package:favourite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLocation});
  final void Function(PlaceLocation location) onSelectLocation;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;

  String get locationImage {
    if (_pickedLocation == null) return "";

    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;

    // Geoapify Static Map
    return 'https://maps.geoapify.com/v1/staticmap'
        '?style=osm-bright-smooth'
        '&width=600'
        '&height=400'
        '&center=lonlat:$lng,$lat'
        '&zoom=16'
        '&marker=lonlat:$lng,$lat'
        ';type:awesome'
        ';color:%23bb3f73'
        ';size:x-large'
        ';icon:marker'
        '&apiKey=d08ffd3cc1fc48e18d5b837dd138dac1';
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();

    // 1️⃣ Check service + permission
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled && !await location.requestService()) return;

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied &&
        await location.requestPermission() != PermissionStatus.granted) {
      return;
    }

    setState(() => _isGettingLocation = true);

    // 2️⃣ Get GPS coordinates
    final locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;
    if (lat == null || lng == null) {
      print('[ERROR] Could not get latitude/longitude');
      setState(() => _isGettingLocation = false);
      return;
    }

    // 3️⃣ Build reverse‑geocode URL
    final url = Uri.parse(
      'https://api.geoapify.com/v1/geocode/reverse'
      '?lat=$lat&lon=$lng&apiKey=d08ffd3cc1fc48e18d5b837dd138dac1',
    );
    print('[DEBUG] Reverse geocode URL: $url');

    // 4️⃣ Fetch & parse
    late http.Response response;
    try {
      response = await http.get(url);
    } catch (e) {
      print('[ERROR] HTTP request failed: $e');
      setState(() => _isGettingLocation = false);
      return;
    }

    print('[DEBUG] HTTP status: ${response.statusCode}');
    print('[DEBUG] HTTP body: ${response.body}');

    Map<String, dynamic>? resData;
    try {
      resData = json.decode(response.body) as Map<String, dynamic>?;
    } catch (e) {
      print('[ERROR] JSON decode failed: $e');
      setState(() => _isGettingLocation = false);
      return;
    }

    // 5️⃣ Guard: features array must exist
    final features = resData?['features'];
    if (features is! List || features.isEmpty) {
      print('[ERROR] No features returned in reverse‑geocode response');
      setState(() => _isGettingLocation = false);
      return;
    }

    // 6️⃣ Extract formatted address
    final props = features[0]['properties'] as Map<String, dynamic>?;
    final address = props?['formatted'] as String?;
    if (address == null) {
      print('[ERROR] formatted address missing in properties: $props');
      setState(() => _isGettingLocation = false);
      return;
    }

    // 7️⃣ Update state + callback
    setState(() {
      _pickedLocation = PlaceLocation(
        latitude: lat,
        longitude: lng,
        address: address,
      );
      _isGettingLocation = false;
    });
    widget.onSelectLocation(_pickedLocation!);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      "No location chosen",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );

    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    } else if (_pickedLocation != null) {
      previewContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withValues(),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text("Get Current Location"),
              onPressed: _getCurrentLocation,
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text("Select on Map"),
              onPressed: () {
                // TODO: implement map selection
              },
            ),
          ],
        ),
      ],
    );
  }
}
