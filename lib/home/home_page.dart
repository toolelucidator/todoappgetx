import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/home_controller.dart';

class HomePage extends StatelessWidget {
  // The widget's constructor
  HomePage({Key? key}) : super(key: key);
  final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Let's add some fancy background colors
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.blue, Colors.red],
          ),
        ),
        child: Obx(
          () => SafeArea(
            // Our page based on a single column at its root.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // A row within the column containing an icon and text.
                Container(
                  // The container will have a margin on left and right of 24
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  // the decoration allows us to customize our container
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // We add padding to our row for extra space around it.
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_city_outlined,
                          size: 32,
                        ),
                        SizedBox(width: 8),
                        // This tells the Text to use the maximum space possible.
                        Expanded(
                          // We will fetch the user's current city
                          child: (_controller.isLoading.value)
                              ? CircularProgressIndicator()
                              : Text(
                                  "Your location is ${_controller.address}",
                                  style: TextStyle(fontSize: 18),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.thermostat_outlined, size: 32),
                        SizedBox(width: 8),
                        Expanded(
                          // We will use the city data to fetch the weather
                          child: Text(
                            "The temperature is TODO",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.info_outline, size: 32),
                        SizedBox(width: 8),
                        Expanded(
                          // We will give advice on what to do
                          child: Text(
                            "You should TODO",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
