import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_model.dart';

class ApiCall {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=d88f75f7bf1b1e2ee1656898fe39c10a&units=metric");

    var response = await http.get(endpoint);

    var body = jsonDecode(response.body);

    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
 }