import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_yahoo_weather/weather_model.dart';

class FlutterPluginYahooWeather {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_yahoo_weather');

  static Future<WeatherModel> getWeatherApi(String appId, String consumerKey,
      String consumerSecret, String requestUrl) async {
    final String dataJson = await _channel.invokeMethod('getWeatherApi', {
      'APP_ID': appId,
      'CONSUMER_KEY': consumerKey,
      'CONSUMER_SECRET': consumerSecret,
      'REQUEST_URL': requestUrl
    });
    return WeatherModel.fromJson(jsonDecode(dataJson));
  }
}
