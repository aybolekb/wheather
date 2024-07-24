import 'package:flutter/material.dart';
import 'package:wheather/data/dio_service.dart';
import 'package:wheather/models/weather.dart';

class RepositoryProvider extends ChangeNotifier {
  Weather? weather;
  bool isWeatherLoaded = false;

  getCityWeather({city}) async {
    isWeatherLoaded = false;
    notifyListeners();

    weather = await DioService().getAllProducts(q: city);

    isWeatherLoaded = true;

    notifyListeners();
  }
}
