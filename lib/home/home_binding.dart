import 'package:get/get.dart';

import '../Controller/home_controller.dart';
import '../repositories/weather_repository.dart';
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherRepository());
    Get.lazyPut(() => HomeController());  }
}