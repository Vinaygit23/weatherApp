
import 'package:get/get.dart';
import 'package:whetherntouch/apiRepos/api_services.dart';
import 'package:whetherntouch/model/weather_model.dart';

class WeatherController extends GetxController{
   var isLoading = true.obs;
   var weatherList = WeatherModel().obs;

  void fetchData() async {
     try{
       isLoading(true);
       var weatherNewData = await ApiServices.getWeatherData();
       if(weatherNewData != null){
         weatherList.value = weatherNewData;
       }
     }finally{
       isLoading(false);
     }
  }
}