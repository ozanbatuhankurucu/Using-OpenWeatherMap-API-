import 'package:geolocator/geolocator.dart';

class Location {
  double _longitude;
  double _latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _longitude = position.longitude;
      _latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }

  double getLongitude() {
    return  _longitude;
  }

  double getLatitude() {
    return _latitude;
  }
}
