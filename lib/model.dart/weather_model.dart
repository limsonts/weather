class WeatherResponseModel {
  String? message;
  String? cod;
  int? count;
  List<Listing>? list;

  WeatherResponseModel({this.message, this.cod, this.count, this.list});

  WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    cod = json['cod'];
    count = json['count'];
    if (json['list'] != null) {
      list = <Listing>[];
      json['list'].forEach((v) {
        list!.add(new Listing.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['cod'] = this.cod;
    data['count'] = this.count;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listing {
  int? id;
  String? name;
  Coord? coord;
  Main? main;
  int? dt;
  Wind? wind;
  Sys? sys;
  Null? rain;
  Null? snow;
  Clouds? clouds;
  List<weathersdetails>? weather;

  Listing(
      {this.id,
      this.name,
      this.coord,
      this.main,
      this.dt,
      this.wind,
      this.sys,
      this.rain,
      this.snow,
      this.clouds,
      this.weather});

  Listing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    dt = json['dt'];
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    rain = json['rain'];
    snow = json['snow'];
    clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    if (json['weather'] != null) {
      weather = <weathersdetails>[];
      json['weather'].forEach((v) {
        weather!.add(new weathersdetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.coord != null) {
      data['coord'] = this.coord!.toJson();
    }
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    data['dt'] = this.dt;
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    if (this.sys != null) {
      data['sys'] = this.sys!.toJson();
    }
    data['rain'] = this.rain;
    data['snow'] = this.snow;
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coord {
  double? lat;
  double? lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['temp_min'] = this.tempMin;
    data['temp_max'] = this.tempMax;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    return data;
  }
}

class Wind {
  double? speed;
  int? deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    return data;
  }
}

class Sys {
  String? country;

  Sys({this.country});

  Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    return data;
  }
}

class weathersdetails {
  int? id;
  String? main;
  String? description;
  String? icon;

  weathersdetails({this.id, this.main, this.description, this.icon});

  weathersdetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}