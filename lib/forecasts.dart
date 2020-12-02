class Forecast {
  String day;
  int date;
  int low;
  int high;
  String text;
  int code;

  Forecast(this.day, this.date, this.low, this.high, this.text, this.code);

  Forecast.fromJson(Map<String, dynamic> json) {
    this.day = json['day'];
    this.date = json['date'];
    this.low = json['low'];
    this.high = json['high'];
    this.text = json['text'];
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['day'] = this.day;
    json['date'] = this.date;
    json['low'] = this.low;
    json['high'] = this.high;
    json['text'] = this.text;
    json['code'] = this.code;
    return json;
  }
}
