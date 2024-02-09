// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  var cod;
  var message;
  var cnt;
  List<ListElement>? list;
  City? city;

  WeatherModel({
     this.cod,
     this.message,
     this.cnt,
     this.list,
     this.city,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    cod: json["cod"],
    message: json["message"],
    cnt: json["cnt"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    city: City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "cod": cod,
    "message": message,
    "cnt": cnt,
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
    "city": city!.toJson(),
  };
}

class City {
  var id;
  var name;
  Coord? coord;
  var country;
  var population;
  var timezone;
  var sunrise;
  var sunset;

  City({
     this.id,
     this.name,
     this.coord,
     this.country,
     this.population,
     this.timezone,
     this.sunrise,
     this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    coord: Coord.fromJson(json["coord"]),
    country: json["country"],
    population: json["population"],
    timezone: json["timezone"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "coord": coord!.toJson(),
    "country": country,
    "population": population,
    "timezone": timezone,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class Coord {
  var lat;
  var lon;

  Coord({
     this.lat,
     this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
  };
}

class ListElement {
  var dt;
  MainClass? main;
  List<Weather> ?weather;
  Clouds? clouds;
  Wind? wind;
  var visibility;
  var pop;
  Sys? sys;
  DateTime? dtTxt;
  Snow? snow;

  ListElement({
     this.dt,
     this.main,
     this.weather,
     this.clouds,
     this.wind,
     this.visibility,
     this.pop,
     this.sys,
     this.dtTxt,
    this.snow,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    dt: json["dt"],
    main: MainClass.fromJson(json["main"]),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    clouds: Clouds.fromJson(json["clouds"]),
    wind: Wind.fromJson(json["wind"]),
    visibility: json["visibility"],
    pop: json["pop"]?.toDouble(),
    sys: Sys.fromJson(json["sys"]),
    dtTxt: DateTime.parse(json["dt_txt"]),
    snow: json["snow"] == null ? null : Snow.fromJson(json["snow"]),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "main": main!.toJson(),
    "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
    "clouds": clouds!.toJson(),
    "wind": wind!.toJson(),
    "visibility": visibility,
    "pop": pop,
    "sys": sys!.toJson(),
    "dt_txt": dtTxt!.toIso8601String(),
    "snow": snow?.toJson(),
  };
}

class Clouds {
  var all;

  Clouds({
     this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}

class MainClass {
  var temp;
  var feelsLike;
  var tempMin;
  var tempMax;
  var pressure;
  var seaLevel;
  var grndLevel;
  var humidity;
  var tempKf;

  MainClass({
     this.temp,
     this.feelsLike,
     this.tempMin,
     this.tempMax,
     this.pressure,
     this.seaLevel,
     this.grndLevel,
     this.humidity,
     this.tempKf,
  });

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
    temp: json["temp"]?.toDouble(),
    feelsLike: json["feels_like"]?.toDouble(),
    tempMin: json["temp_min"]?.toDouble(),
    tempMax: json["temp_max"]?.toDouble(),
    pressure: json["pressure"],
    seaLevel: json["sea_level"],
    grndLevel: json["grnd_level"],
    humidity: json["humidity"],
    tempKf: json["temp_kf"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "sea_level": seaLevel,
    "grnd_level": grndLevel,
    "humidity": humidity,
    "temp_kf": tempKf,
  };
}

class Snow {
  var the3H;

  Snow({
     this.the3H,
  });

  factory Snow.fromJson(Map<String, dynamic> json) => Snow(
    the3H: json["3h"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "3h": the3H,
  };
}

class Sys {
  Pod? pod;

  Sys({
     this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    pod: podValues.map[json["pod"]]!,
  );

  Map<String, dynamic> toJson() => {
    "pod": podValues.reverse[pod],
  };
}

enum Pod {
  D,
  N
}

final podValues = EnumValues({
  "d": Pod.D,
  "n": Pod.N
});

class Weather {
  var id;
  MainEnum? main;
  Description? description;
  Icon ?icon;

  Weather({
     this.id,
     this.main,
     this.description,
     this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: mainEnumValues.map[json["main"]],
    description: descriptionValues.map[json["description"]],
    icon: iconValues.map[json["icon"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": mainEnumValues.reverse[main],
    "description": descriptionValues.reverse[description],
    "icon": iconValues.reverse[icon],
  };
}

enum Description {
  BROKEN_CLOUDS,
  LIGHT_SNOW,
  OVERCAST_CLOUDS,
  SCATTERED_CLOUDS,
  SNOW
}

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "light snow": Description.LIGHT_SNOW,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS,
  "snow": Description.SNOW
});

enum Icon {
  THE_03_D,
  THE_04_D,
  THE_04_N,
  THE_13_D,
  THE_13_N
}

final iconValues = EnumValues({
  "03d": Icon.THE_03_D,
  "04d": Icon.THE_04_D,
  "04n": Icon.THE_04_N,
  "13d": Icon.THE_13_D,
  "13n": Icon.THE_13_N
});

enum MainEnum {
  CLOUDS,
  SNOW
}

final mainEnumValues = EnumValues({
  "Clouds": MainEnum.CLOUDS,
  "Snow": MainEnum.SNOW
});

class Wind {
  var speed;
  var deg;
  var gust;

  Wind({
     this.speed,
     this.deg,
     this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"]?.toDouble(),
    deg: json["deg"],
    gust: json["gust"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
    "gust": gust,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
