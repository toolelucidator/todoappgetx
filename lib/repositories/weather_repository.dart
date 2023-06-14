import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

import '../models/location_model.dart';

class WeatherRepository {
  Future<Tuple2<LocationModel?, Error?>> getCurrentLocation() async {
    LocationModel? locationData;
    // Time consuming operation. We have to wait for the server's response.
    var url = Uri.http('ip-api.com', '/json');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      // We use the json decoded response and apply to our .fromJson function
      locationData = LocationModel.fromJson(jsonResponse);
      print('Request successful: $jsonResponse');
      return Tuple2(locationData, null);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return Tuple2(null, Error());
    }
  }
}
