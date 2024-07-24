import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wheather/models/weather.dart';

class DioService {
  static const receiveTimeout = 20 * 60 * 1000;
  static const connectTimeout = 20 * 60 * 1000;
  static const apiKey = "ce4ae9ce17f2b532d16c3d028074bc37";
  static const String url = "https://api.openweathermap.org/data/2.5";

  DioService()
      : _dio = Dio(BaseOptions(
          baseUrl: url,
          queryParameters: {'appId': apiKey, 'units': 'metric'},
          connectTimeout: const Duration(milliseconds: connectTimeout),
          receiveTimeout: const Duration(milliseconds: receiveTimeout),
        ));
  late final Dio _dio;

  Future<Weather?> getAllProducts({required q}) async {
    try {
      final response = await _dio.get('/weather', queryParameters: {"q": q});

      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
