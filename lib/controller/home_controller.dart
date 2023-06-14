import 'package:get/get.dart';
import '../models/location_model.dart';
import '../repositories/weather_repository.dart';

class HomeController extends GetxController {
  // By using Get.find(), Get will find the object in the binding class and give it to you.
  final WeatherRepository _repository = Get.find();
  var isLoading = false.obs;
  var errorMessage = "".obs;

  // A nullable Rx instance of LocationData. Initial value is null.
  Rxn<LocationModel> locationData = Rxn();

  // This will be retrieved by the UI for a pretty display.
  String get address =>
      "${locationData.value?.regionName}, ${locationData.value?.country}";

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    isLoading.value = true;
    var results = await _repository.getCurrentLocation();
    LocationModel? location = results.item1;
    print(location?.regionName);
    errorMessage.value = results.item2.toString();

    // We assign the response from our API call to our Rx object.
    locationData.value = location;
    isLoading.value = false;
  }

  getTemperatureForCurrentLocation() {
    // TODO add the logic to fetch temperature for current city
  }
}
