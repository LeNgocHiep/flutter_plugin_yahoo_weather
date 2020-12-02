import 'package:flutter_plugin_yahoo_weather/current_observation.dart';
import 'package:flutter_plugin_yahoo_weather/forecasts.dart';
import 'package:flutter_plugin_yahoo_weather/location.dart';
import 'dart:convert';

class WeatherModel {
  Location location;
  CurrentObservation currentObservation;
  List<Forecast> forecasts;

  WeatherModel(this.location, this.currentObservation, this.forecasts);

  WeatherModel.fromJson(Map<String, dynamic> json) {
    this.location = Location.fromJson(json['location']);
    this.currentObservation =
        CurrentObservation.fromJson(json['current_observation']);
    List<dynamic> list = json['forecasts'];
    this.forecasts = list.map(
        (e) => Forecast.fromJson(e)).toList(); //Forecast.fromJson(json['forecasts']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['location'] = this.location.toJson();
    json['current_observation'] = this.currentObservation.toJson();
    json['forecasts'] = jsonEncode(this.forecasts.map((e) => e.toJson()));
    return json;
  }
}
