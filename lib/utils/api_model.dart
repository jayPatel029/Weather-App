class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;
  String? icon;
  String? description;


  Weather({
    this.cityName,
    this.temp,
    this.feels_like,
    this.humidity,
    this.pressure,
    this.wind,
    this.icon,
    this.description,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    // pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
    icon = json["weather"][0]["icon"];
    description = json["weather"][0]["description"];

  }
}
