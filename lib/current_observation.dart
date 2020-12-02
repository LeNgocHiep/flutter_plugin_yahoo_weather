class CurrentObservation {
  Wind wind;
  Atmosphere atmosphere;
  Astronomy astronomy;
  Condition condition;
  int pubDate;

  CurrentObservation.fromJson(Map<String, dynamic> json) {
    this.wind = Wind.fromJson(json['wind']);
    this.atmosphere = Atmosphere.fromJson(json['atmosphere']);
    this.astronomy = Astronomy.fromJson(json['astronomy']);
    this.condition = Condition.fromJson(json['condition']);
    this.pubDate = json['pubDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['wind'] = this.wind.toJson();
    json['atmosphere'] = this.atmosphere.toJson();
    json['astronomy'] = this.astronomy.toJson();
    json['condition'] = this.condition.toJson();
    json['pubDate'] = this.pubDate;
    return json;
  }
}

class Wind {
  int chill;
  int direction;
  double speed;

  Wind(this.chill, this.direction, this.speed);

  Wind.fromJson(Map<String, dynamic> json) {
    this.chill = json['chill'];
    this.direction = json['direction'];
    this.speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['chill'] = this.chill;
    json['direction'] = this.direction;
    json['speed'] = this.speed;
    return json;
  }
}

class Atmosphere {
  int humidity;
  double visibility;
  double pressure;

  Atmosphere(this.humidity, this.visibility, this.pressure);

  Atmosphere.fromJson(Map<String, dynamic> json) {
    this.humidity = json['humidity'];
    this.visibility = json['visibility'];
    this.pressure = json['pressure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['humidity'] = this.humidity;
    json['visibility'] = this.visibility;
    json['pressure'] = this.pressure;
    return json;
  }
}

class Astronomy {
  String sunrise;
  String sunset;

  Astronomy(this.sunrise, this.sunset);

  Astronomy.fromJson(Map<String, dynamic> json) {
    this.sunrise = json['sunrise'];
    this.sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['sunrise'] = this.sunrise;
    json['sunset'] = this.sunset;
    return json;
  }
}

class Condition {
  String text;
  int code;
  int temperature;

  Condition(this.text, this.code, this.temperature);

  Condition.fromJson(Map<String, dynamic> json) {
    this.text = json['text'];
    this.code = json['code'];
    this.temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['text'] = this.text;
    json['code'] = this.code;
    json['temperature'] = this.temperature;
    return json;
  }
}
