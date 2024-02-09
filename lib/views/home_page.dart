
import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whetherntouch/constant/color.dart';
import 'package:whetherntouch/controller/wheater_controller.dart';
import '../widgets/addition_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherController weatherController = Get.put(WeatherController());
  bool hasInternet = false;

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      hasInternet = connectivityResult != ConnectivityResult.none;
    });
    if (hasInternet) {
      weatherController.fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.green[50],
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundColor: iconBackgroundColor,
              child: Icon(
                Icons.padding_outlined,
                color: Colors.red,
              )),
        ),
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: iconBackgroundColor,
              child: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.notifications_active_sharp,
                    color: Colors.red,
                  )),
            ),
          )
        ],
      ),
      body: hasInternet ? Obx(() {
        if (weatherController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final allData = weatherController.weatherList.value.list![0];
          final currentData = allData.main!.temp;
          final currentPressure = allData.main!.pressure;
          final windSpeed = allData.wind!.speed;
          final humidity = allData.main!.humidity;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start, children: [
              //main card
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                size: 45,
                                color: Colors.red,
                              ),
                              Text(
                                weatherController.weatherList.value.city!.name
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 44, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 150.0),
                            child: Text(
                              '${(currentData - 273.15).toStringAsFixed(2)} °C',
                              style: TextStyle(
                                  fontSize: 100, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInfoItems(
                      icon: Icons.water_drop_sharp,
                      name: 'humidity',
                      value: humidity.toString(),
                    ),
                    AdditionalInfoItems(
                      icon: Icons.air,
                      name: 'Wild Speed',
                      value: windSpeed.toString(),
                    ),
                    AdditionalInfoItems(
                      icon: Icons.beach_access,
                      name: 'Pressure',
                      value: currentPressure.toString(),
                    ),
                  ],
                ),
              )
            ]),
          );
        }
      }):
      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child:
                  Image.asset('assets/images/no in.gif')),
              SizedBox(
                height: 100,
              ),
              Center(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Please Check Your',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black26
                          ),
                        ),
                        TextSpan(
                          text: ' Internet Connection',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.red
                          ),
                        ),
                      ]),
                    ),
                  )),
            ],
          )),

    );
  }
}
