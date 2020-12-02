class Location {
  int woeid;
  String city;
  String region;
  String country;
  double lat;
  double long;
  String timezoneId;

  Location(this.woeid, this.city, this.region, this.country, this.lat,
      this.long, this.timezoneId);

  Location.fromJson(Map<String, dynamic> json) {
    this.woeid = json['woeid'];
    this.city = json['city'];
    this.region = json['region'];
    this.country = json['country'];
    this.lat = json['lat'];
    this.long = json['long'];
    this.timezoneId = json['timezone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['woeid'] = this.woeid;
    json['city'] = this.city;
    json['region'] = this.region;
    json['country'] = this.country;
    json['lat'] = this.lat;
    json['long'] = this.long;
    json['timezone_id'] = this.timezoneId;
    return json;
  }
}
