import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart'; // Import the geocoding package
import 'dart:async';

class LocationService {
  String _userLocation = 'INDIA';
  late double latitude; // Mark as late
  late double longitude; // Mark as late

  Future<String> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
     
      if (permission == LocationPermission.denied) {
        // Handle denied permission
        return _userLocation;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Use geocoding package for reverse geocoding
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark first = placemarks.first;

        var country = first.country;
        var adminArea = first.administrativeArea;
        var subAdminArea = first.subAdministrativeArea;
        var locality = first.locality;
        var subLocality = first.subLocality;

        _userLocation = '$country $adminArea $subAdminArea $locality $subLocality';
        _userLocation = _userLocation.toString().toUpperCase();

        return _userLocation;
      } else {
        return _userLocation;
      }
    } catch (e) {
      print('$e       : occurred in LocationService.dart');
      return _userLocation;
    }
  }

  Future<double> getLat() async {
    try {
      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      print("here  ${position.latitude}");
      return position.latitude;
    } catch (e) {
      print(e);
      return 20.5937;
    }
  }

  Future<double> getLong() async {
    try {
      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      return position.longitude;
    } catch (e) {
      print(e);

      return 78.9629;
    }
  }
}
