import 'package:todoappgetx/entities/location.dart';

class LocationModel extends Location {
  LocationModel();

  LocationModel.fromJson(dynamic json) {
    country = json['country'];
    regionName = json['regionName'];
    lat = json['lat'];
    lon = json['lon'];
  }
}
