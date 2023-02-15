class WeatherData {
  Location? _location;
  Current? _current;
  Forecast? _forecast;

  WeatherData({Location? location, Current? current, Forecast? forecast}) {
    if (location != null) {
      this._location = location;
    }
    if (current != null) {
      this._current = current;
    }
    if (forecast != null) {
      this._forecast = forecast;
    }
  }

  Location? get location => _location;
  set location(Location? location) => _location = location;
  Current? get current => _current;
  set current(Current? current) => _current = current;
  Forecast? get forecast => _forecast;
  set forecast(Forecast? forecast) => _forecast = forecast;

  WeatherData.fromJson(Map<String, dynamic> json) {
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    _current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    _forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._location != null) {
      data['location'] = this._location!.toJson();
    }
    if (this._current != null) {
      data['current'] = this._current!.toJson();
    }
    if (this._forecast != null) {
      data['forecast'] = this._forecast!.toJson();
    }
    return data;
  }
}

class Location {
  String? _name;
  String? _region;
  String? _country;
  dynamic _lat;
  dynamic _lon;
  String? _tzId;
  dynamic _localtimeEpoch;
  String? _localtime;

  Location(
      {String? name,
      String? region,
      String? country,
      dynamic lat,
      dynamic lon,
      String? tzId,
      dynamic localtimeEpoch,
      String? localtime}) {
    if (name != null) {
      this._name = name;
    }
    if (region != null) {
      this._region = region;
    }
    if (country != null) {
      this._country = country;
    }
    if (lat != null) {
      this._lat = lat;
    }
    if (lon != null) {
      this._lon = lon;
    }
    if (tzId != null) {
      this._tzId = tzId;
    }
    if (localtimeEpoch != null) {
      this._localtimeEpoch = localtimeEpoch;
    }
    if (localtime != null) {
      this._localtime = localtime;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get region => _region;
  set region(String? region) => _region = region;
  String? get country => _country;
  set country(String? country) => _country = country;
  dynamic get lat => _lat;
  set lat(dynamic lat) => _lat = lat;
  dynamic get lon => _lon;
  set lon(dynamic lon) => _lon = lon;
  String? get tzId => _tzId;
  set tzId(String? tzId) => _tzId = tzId;
  dynamic get localtimeEpoch => _localtimeEpoch;
  set localtimeEpoch(dynamic localtimeEpoch) =>
      _localtimeEpoch = localtimeEpoch;
  String? get localtime => _localtime;
  set localtime(String? localtime) => _localtime = localtime;

  Location.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _region = json['region'];
    _country = json['country'];
    _lat = json['lat'];
    _lon = json['lon'];
    _tzId = json['tz_id'];
    _localtimeEpoch = json['localtime_epoch'];
    _localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['region'] = this._region;
    data['country'] = this._country;
    data['lat'] = this._lat;
    data['lon'] = this._lon;
    data['tz_id'] = this._tzId;
    data['localtime_epoch'] = this._localtimeEpoch;
    data['localtime'] = this._localtime;
    return data;
  }
}

class Current {
  dynamic _lastUpdatedEpoch;
  String? _lastUpdated;
  dynamic _tempC;
  dynamic _tempF;
  dynamic _isDay;
  Condition? _condition;
  dynamic _windMph;
  dynamic _windKph;
  dynamic _windDegree;
  String? _windDir;
  dynamic _pressureMb;
  dynamic _pressureIn;
  dynamic _precipMm;
  dynamic _precipIn;
  dynamic _humidity;
  dynamic _cloud;
  dynamic _feelslikeC;
  dynamic _feelslikeF;
  dynamic _visKm;
  dynamic _visMiles;
  dynamic _uv;
  dynamic _gustMph;
  dynamic _gustKph;

  Current(
      {dynamic lastUpdatedEpoch,
      String? lastUpdated,
      dynamic tempC,
      dynamic tempF,
      dynamic isDay,
      Condition? condition,
      dynamic windMph,
      dynamic windKph,
      dynamic windDegree,
      String? windDir,
      dynamic pressureMb,
      dynamic pressureIn,
      dynamic precipMm,
      dynamic precipIn,
      dynamic humidity,
      dynamic cloud,
      dynamic feelslikeC,
      dynamic feelslikeF,
      dynamic visKm,
      dynamic visMiles,
      dynamic uv,
      dynamic gustMph,
      dynamic gustKph}) {
    if (lastUpdatedEpoch != null) {
      this._lastUpdatedEpoch = lastUpdatedEpoch;
    }
    if (lastUpdated != null) {
      this._lastUpdated = lastUpdated;
    }
    if (tempC != null) {
      this._tempC = tempC;
    }
    if (tempF != null) {
      this._tempF = tempF;
    }
    if (isDay != null) {
      this._isDay = isDay;
    }
    if (condition != null) {
      this._condition = condition;
    }
    if (windMph != null) {
      this._windMph = windMph;
    }
    if (windKph != null) {
      this._windKph = windKph;
    }
    if (windDegree != null) {
      this._windDegree = windDegree;
    }
    if (windDir != null) {
      this._windDir = windDir;
    }
    if (pressureMb != null) {
      this._pressureMb = pressureMb;
    }
    if (pressureIn != null) {
      this._pressureIn = pressureIn;
    }
    if (precipMm != null) {
      this._precipMm = precipMm;
    }
    if (precipIn != null) {
      this._precipIn = precipIn;
    }
    if (humidity != null) {
      this._humidity = humidity;
    }
    if (cloud != null) {
      this._cloud = cloud;
    }
    if (feelslikeC != null) {
      this._feelslikeC = feelslikeC;
    }
    if (feelslikeF != null) {
      this._feelslikeF = feelslikeF;
    }
    if (visKm != null) {
      this._visKm = visKm;
    }
    if (visMiles != null) {
      this._visMiles = visMiles;
    }
    if (uv != null) {
      this._uv = uv;
    }
    if (gustMph != null) {
      this._gustMph = gustMph;
    }
    if (gustKph != null) {
      this._gustKph = gustKph;
    }
  }

  dynamic get lastUpdatedEpoch => _lastUpdatedEpoch;
  set lastUpdatedEpoch(dynamic lastUpdatedEpoch) =>
      _lastUpdatedEpoch = lastUpdatedEpoch;
  String? get lastUpdated => _lastUpdated;
  set lastUpdated(String? lastUpdated) => _lastUpdated = lastUpdated;
  dynamic get tempC => _tempC;
  set tempC(dynamic tempC) => _tempC = tempC;
  dynamic get tempF => _tempF;
  set tempF(dynamic tempF) => _tempF = tempF;
  dynamic get isDay => _isDay;
  set isDay(dynamic isDay) => _isDay = isDay;
  Condition? get condition => _condition;
  set condition(Condition? condition) => _condition = condition;
  dynamic get windMph => _windMph;
  set windMph(dynamic windMph) => _windMph = windMph;
  dynamic get windKph => _windKph;
  set windKph(dynamic windKph) => _windKph = windKph;
  dynamic get windDegree => _windDegree;
  set windDegree(dynamic windDegree) => _windDegree = windDegree;
  String? get windDir => _windDir;
  set windDir(String? windDir) => _windDir = windDir;
  dynamic get pressureMb => _pressureMb;
  set pressureMb(dynamic pressureMb) => _pressureMb = pressureMb;
  dynamic get pressureIn => _pressureIn;
  set pressureIn(dynamic pressureIn) => _pressureIn = pressureIn;
  dynamic get precipMm => _precipMm;
  set precipMm(dynamic precipMm) => _precipMm = precipMm;
  dynamic get precipIn => _precipIn;
  set precipIn(dynamic precipIn) => _precipIn = precipIn;
  dynamic get humidity => _humidity;
  set humidity(dynamic humidity) => _humidity = humidity;
  dynamic get cloud => _cloud;
  set cloud(dynamic cloud) => _cloud = cloud;
  dynamic get feelslikeC => _feelslikeC;
  set feelslikeC(dynamic feelslikeC) => _feelslikeC = feelslikeC;
  dynamic get feelslikeF => _feelslikeF;
  set feelslikeF(dynamic feelslikeF) => _feelslikeF = feelslikeF;
  dynamic get visKm => _visKm;
  set visKm(dynamic visKm) => _visKm = visKm;
  dynamic get visMiles => _visMiles;
  set visMiles(dynamic visMiles) => _visMiles = visMiles;
  dynamic get uv => _uv;
  set uv(dynamic uv) => _uv = uv;
  dynamic get gustMph => _gustMph;
  set gustMph(dynamic gustMph) => _gustMph = gustMph;
  dynamic get gustKph => _gustKph;
  set gustKph(dynamic gustKph) => _gustKph = gustKph;

  Current.fromJson(Map<String, dynamic> json) {
    _lastUpdatedEpoch = json['last_updated_epoch'];
    _lastUpdated = json['last_updated'];
    _tempC = json['temp_c'];
    _tempF = json['temp_f'];
    _isDay = json['is_day'];
    _condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    _windMph = json['wind_mph'];
    _windKph = json['wind_kph'];
    _windDegree = json['wind_degree'];
    _windDir = json['wind_dir'];
    _pressureMb = json['pressure_mb'];
    _pressureIn = json['pressure_in'];
    _precipMm = json['precip_mm'];
    _precipIn = json['precip_in'];
    _humidity = json['humidity'];
    _cloud = json['cloud'];
    _feelslikeC = json['feelslike_c'];
    _feelslikeF = json['feelslike_f'];
    _visKm = json['vis_km'];
    _visMiles = json['vis_miles'];
    _uv = json['uv'];
    _gustMph = json['gust_mph'];
    _gustKph = json['gust_kph'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_updated_epoch'] = this._lastUpdatedEpoch;
    data['last_updated'] = this._lastUpdated;
    data['temp_c'] = this._tempC;
    data['temp_f'] = this._tempF;
    data['is_day'] = this._isDay;
    if (this._condition != null) {
      data['condition'] = this._condition!.toJson();
    }
    data['wind_mph'] = this._windMph;
    data['wind_kph'] = this._windKph;
    data['wind_degree'] = this._windDegree;
    data['wind_dir'] = this._windDir;
    data['pressure_mb'] = this._pressureMb;
    data['pressure_in'] = this._pressureIn;
    data['precip_mm'] = this._precipMm;
    data['precip_in'] = this._precipIn;
    data['humidity'] = this._humidity;
    data['cloud'] = this._cloud;
    data['feelslike_c'] = this._feelslikeC;
    data['feelslike_f'] = this._feelslikeF;
    data['vis_km'] = this._visKm;
    data['vis_miles'] = this._visMiles;
    data['uv'] = this._uv;
    data['gust_mph'] = this._gustMph;
    data['gust_kph'] = this._gustKph;
    return data;
  }
}

class Condition {
  String? _text;
  String? _icon;
  dynamic _code;

  Condition({String? text, String? icon, dynamic code}) {
    if (text != null) {
      this._text = text;
    }
    if (icon != null) {
      this._icon = icon;
    }
    if (code != null) {
      this._code = code;
    }
  }

  String? get text => _text;
  set text(String? text) => _text = text;
  String? get icon => _icon;
  set icon(String? icon) => _icon = icon;
  dynamic get code => _code;
  set code(dynamic code) => _code = code;

  Condition.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
    _icon = json['icon'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this._text;
    data['icon'] = this._icon;
    data['code'] = this._code;
    return data;
  }
}

class Forecast {
  List<Forecastday>? _forecastday;

  Forecast({List<Forecastday>? forecastday}) {
    if (forecastday != null) {
      this._forecastday = forecastday;
    }
  }

  List<Forecastday>? get forecastday => _forecastday;
  set forecastday(List<Forecastday>? forecastday) => _forecastday = forecastday;

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      _forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        _forecastday!.add(new Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._forecastday != null) {
      data['forecastday'] = this._forecastday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Forecastday {
  String? _date;
  dynamic _dateEpoch;
  Day? _day;
  Astro? _astro;
  List<Hour>? _hour;

  Forecastday(
      {String? date,
      dynamic dateEpoch,
      Day? day,
      Astro? astro,
      List<Hour>? hour}) {
    if (date != null) {
      this._date = date;
    }
    if (dateEpoch != null) {
      this._dateEpoch = dateEpoch;
    }
    if (day != null) {
      this._day = day;
    }
    if (astro != null) {
      this._astro = astro;
    }
    if (hour != null) {
      this._hour = hour;
    }
  }

  String? get date => _date;
  set date(String? date) => _date = date;
  dynamic get dateEpoch => _dateEpoch;
  set dateEpoch(dynamic dateEpoch) => _dateEpoch = dateEpoch;
  Day? get day => _day;
  set day(Day? day) => _day = day;
  Astro? get astro => _astro;
  set astro(Astro? astro) => _astro = astro;
  List<Hour>? get hour => _hour;
  set hour(List<Hour>? hour) => _hour = hour;

  Forecastday.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    _dateEpoch = json['date_epoch'];
    _day = json['day'] != null ? new Day.fromJson(json['day']) : null;
    _astro = json['astro'] != null ? new Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      _hour = <Hour>[];
      json['hour'].forEach((v) {
        _hour!.add(new Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this._date;
    data['date_epoch'] = this._dateEpoch;
    if (this._day != null) {
      data['day'] = this._day!.toJson();
    }
    if (this._astro != null) {
      data['astro'] = this._astro!.toJson();
    }
    if (this._hour != null) {
      data['hour'] = this._hour!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Day {
  dynamic _maxtempC;
  dynamic _maxtempF;
  dynamic _mintempC;
  dynamic _mintempF;
  dynamic _avgtempC;
  dynamic _avgtempF;
  dynamic _maxwindMph;
  dynamic _maxwindKph;
  dynamic _totalprecipMm;
  dynamic _totalprecipIn;
  dynamic _totalsnowCm;
  dynamic _avgvisKm;
  dynamic _avgvisMiles;
  dynamic _avghumidity;
  dynamic _dailyWillItRain;
  dynamic _dailyChanceOfRain;
  dynamic _dailyWillItSnow;
  dynamic _dailyChanceOfSnow;
  Condition? _condition;
  dynamic _uv;

  Day(
      {dynamic maxtempC,
      dynamic maxtempF,
      dynamic mintempC,
      dynamic mintempF,
      dynamic avgtempC,
      dynamic avgtempF,
      dynamic maxwindMph,
      dynamic maxwindKph,
      dynamic totalprecipMm,
      dynamic totalprecipIn,
      dynamic totalsnowCm,
      dynamic avgvisKm,
      dynamic avgvisMiles,
      dynamic avghumidity,
      dynamic dailyWillItRain,
      dynamic dailyChanceOfRain,
      dynamic dailyWillItSnow,
      dynamic dailyChanceOfSnow,
      Condition? condition,
      dynamic uv}) {
    if (maxtempC != null) {
      this._maxtempC = maxtempC;
    }
    if (maxtempF != null) {
      this._maxtempF = maxtempF;
    }
    if (mintempC != null) {
      this._mintempC = mintempC;
    }
    if (mintempF != null) {
      this._mintempF = mintempF;
    }
    if (avgtempC != null) {
      this._avgtempC = avgtempC;
    }
    if (avgtempF != null) {
      this._avgtempF = avgtempF;
    }
    if (maxwindMph != null) {
      this._maxwindMph = maxwindMph;
    }
    if (maxwindKph != null) {
      this._maxwindKph = maxwindKph;
    }
    if (totalprecipMm != null) {
      this._totalprecipMm = totalprecipMm;
    }
    if (totalprecipIn != null) {
      this._totalprecipIn = totalprecipIn;
    }
    if (totalsnowCm != null) {
      this._totalsnowCm = totalsnowCm;
    }
    if (avgvisKm != null) {
      this._avgvisKm = avgvisKm;
    }
    if (avgvisMiles != null) {
      this._avgvisMiles = avgvisMiles;
    }
    if (avghumidity != null) {
      this._avghumidity = avghumidity;
    }
    if (dailyWillItRain != null) {
      this._dailyWillItRain = dailyWillItRain;
    }
    if (dailyChanceOfRain != null) {
      this._dailyChanceOfRain = dailyChanceOfRain;
    }
    if (dailyWillItSnow != null) {
      this._dailyWillItSnow = dailyWillItSnow;
    }
    if (dailyChanceOfSnow != null) {
      this._dailyChanceOfSnow = dailyChanceOfSnow;
    }
    if (condition != null) {
      this._condition = condition;
    }
    if (uv != null) {
      this._uv = uv;
    }
  }

  dynamic get maxtempC => _maxtempC;
  set maxtempC(dynamic maxtempC) => _maxtempC = maxtempC;
  dynamic get maxtempF => _maxtempF;
  set maxtempF(dynamic maxtempF) => _maxtempF = maxtempF;
  dynamic get mintempC => _mintempC;
  set mintempC(dynamic mintempC) => _mintempC = mintempC;
  dynamic get mintempF => _mintempF;
  set mintempF(dynamic mintempF) => _mintempF = mintempF;
  dynamic get avgtempC => _avgtempC;
  set avgtempC(dynamic avgtempC) => _avgtempC = avgtempC;
  dynamic get avgtempF => _avgtempF;
  set avgtempF(dynamic avgtempF) => _avgtempF = avgtempF;
  dynamic get maxwindMph => _maxwindMph;
  set maxwindMph(dynamic maxwindMph) => _maxwindMph = maxwindMph;
  dynamic get maxwindKph => _maxwindKph;
  set maxwindKph(dynamic maxwindKph) => _maxwindKph = maxwindKph;
  dynamic get totalprecipMm => _totalprecipMm;
  set totalprecipMm(dynamic totalprecipMm) => _totalprecipMm = totalprecipMm;
  dynamic get totalprecipIn => _totalprecipIn;
  set totalprecipIn(dynamic totalprecipIn) => _totalprecipIn = totalprecipIn;
  dynamic get totalsnowCm => _totalsnowCm;
  set totalsnowCm(dynamic totalsnowCm) => _totalsnowCm = totalsnowCm;
  dynamic get avgvisKm => _avgvisKm;
  set avgvisKm(dynamic avgvisKm) => _avgvisKm = avgvisKm;
  dynamic get avgvisMiles => _avgvisMiles;
  set avgvisMiles(dynamic avgvisMiles) => _avgvisMiles = avgvisMiles;
  dynamic get avghumidity => _avghumidity;
  set avghumidity(dynamic avghumidity) => _avghumidity = avghumidity;
  dynamic get dailyWillItRain => _dailyWillItRain;
  set dailyWillItRain(dynamic dailyWillItRain) =>
      _dailyWillItRain = dailyWillItRain;
  dynamic get dailyChanceOfRain => _dailyChanceOfRain;
  set dailyChanceOfRain(dynamic dailyChanceOfRain) =>
      _dailyChanceOfRain = dailyChanceOfRain;
  dynamic get dailyWillItSnow => _dailyWillItSnow;
  set dailyWillItSnow(dynamic dailyWillItSnow) =>
      _dailyWillItSnow = dailyWillItSnow;
  dynamic get dailyChanceOfSnow => _dailyChanceOfSnow;
  set dailyChanceOfSnow(dynamic dailyChanceOfSnow) =>
      _dailyChanceOfSnow = dailyChanceOfSnow;
  Condition? get condition => _condition;
  set condition(Condition? condition) => _condition = condition;
  dynamic get uv => _uv;
  set uv(dynamic uv) => _uv = uv;

  Day.fromJson(Map<String, dynamic> json) {
    _maxtempC = json['maxtemp_c'];
    _maxtempF = json['maxtemp_f'];
    _mintempC = json['mintemp_c'];
    _mintempF = json['mintemp_f'];
    _avgtempC = json['avgtemp_c'];
    _avgtempF = json['avgtemp_f'];
    _maxwindMph = json['maxwind_mph'];
    _maxwindKph = json['maxwind_kph'];
    _totalprecipMm = json['totalprecip_mm'];
    _totalprecipIn = json['totalprecip_in'];
    _totalsnowCm = json['totalsnow_cm'];
    _avgvisKm = json['avgvis_km'];
    _avgvisMiles = json['avgvis_miles'];
    _avghumidity = json['avghumidity'];
    _dailyWillItRain = json['daily_will_it_rain'];
    _dailyChanceOfRain = json['daily_chance_of_rain'];
    _dailyWillItSnow = json['daily_will_it_snow'];
    _dailyChanceOfSnow = json['daily_chance_of_snow'];
    _condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    _uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxtemp_c'] = this._maxtempC;
    data['maxtemp_f'] = this._maxtempF;
    data['mintemp_c'] = this._mintempC;
    data['mintemp_f'] = this._mintempF;
    data['avgtemp_c'] = this._avgtempC;
    data['avgtemp_f'] = this._avgtempF;
    data['maxwind_mph'] = this._maxwindMph;
    data['maxwind_kph'] = this._maxwindKph;
    data['totalprecip_mm'] = this._totalprecipMm;
    data['totalprecip_in'] = this._totalprecipIn;
    data['totalsnow_cm'] = this._totalsnowCm;
    data['avgvis_km'] = this._avgvisKm;
    data['avgvis_miles'] = this._avgvisMiles;
    data['avghumidity'] = this._avghumidity;
    data['daily_will_it_rain'] = this._dailyWillItRain;
    data['daily_chance_of_rain'] = this._dailyChanceOfRain;
    data['daily_will_it_snow'] = this._dailyWillItSnow;
    data['daily_chance_of_snow'] = this._dailyChanceOfSnow;
    if (this._condition != null) {
      data['condition'] = this._condition!.toJson();
    }
    data['uv'] = this._uv;
    return data;
  }
}

class Astro {
  String? _sunrise;
  String? _sunset;
  String? _moonrise;
  String? _moonset;
  String? _moonPhase;
  String? _moonIllumination;
  dynamic _isMoonUp;
  dynamic _isSunUp;

  Astro(
      {String? sunrise,
      String? sunset,
      String? moonrise,
      String? moonset,
      String? moonPhase,
      String? moonIllumination,
      dynamic isMoonUp,
      dynamic isSunUp}) {
    if (sunrise != null) {
      this._sunrise = sunrise;
    }
    if (sunset != null) {
      this._sunset = sunset;
    }
    if (moonrise != null) {
      this._moonrise = moonrise;
    }
    if (moonset != null) {
      this._moonset = moonset;
    }
    if (moonPhase != null) {
      this._moonPhase = moonPhase;
    }
    if (moonIllumination != null) {
      this._moonIllumination = moonIllumination;
    }
    if (isMoonUp != null) {
      this._isMoonUp = isMoonUp;
    }
    if (isSunUp != null) {
      this._isSunUp = isSunUp;
    }
  }

  String? get sunrise => _sunrise;
  set sunrise(String? sunrise) => _sunrise = sunrise;
  String? get sunset => _sunset;
  set sunset(String? sunset) => _sunset = sunset;
  String? get moonrise => _moonrise;
  set moonrise(String? moonrise) => _moonrise = moonrise;
  String? get moonset => _moonset;
  set moonset(String? moonset) => _moonset = moonset;
  String? get moonPhase => _moonPhase;
  set moonPhase(String? moonPhase) => _moonPhase = moonPhase;
  String? get moonIllumination => _moonIllumination;
  set moonIllumination(String? moonIllumination) =>
      _moonIllumination = moonIllumination;
  dynamic get isMoonUp => _isMoonUp;
  set isMoonUp(dynamic isMoonUp) => _isMoonUp = isMoonUp;
  dynamic get isSunUp => _isSunUp;
  set isSunUp(dynamic isSunUp) => _isSunUp = isSunUp;

  Astro.fromJson(Map<String, dynamic> json) {
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _moonrise = json['moonrise'];
    _moonset = json['moonset'];
    _moonPhase = json['moon_phase'];
    _moonIllumination = json['moon_illumination'];
    _isMoonUp = json['is_moon_up'];
    _isSunUp = json['is_sun_up'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sunrise'] = this._sunrise;
    data['sunset'] = this._sunset;
    data['moonrise'] = this._moonrise;
    data['moonset'] = this._moonset;
    data['moon_phase'] = this._moonPhase;
    data['moon_illumination'] = this._moonIllumination;
    data['is_moon_up'] = this._isMoonUp;
    data['is_sun_up'] = this._isSunUp;
    return data;
  }
}

class Hour {
  dynamic _timeEpoch;
  String? _time;
  dynamic _tempC;
  dynamic _tempF;
  dynamic _isDay;
  Condition? _condition;
  dynamic _windMph;
  dynamic _windKph;
  dynamic _windDegree;
  String? _windDir;
  dynamic _pressureMb;
  dynamic _pressureIn;
  dynamic _precipMm;
  dynamic _precipIn;
  dynamic _humidity;
  dynamic _cloud;
  dynamic _feelslikeC;
  dynamic _feelslikeF;
  dynamic _windchillC;
  dynamic _windchillF;
  dynamic _heatindexC;
  dynamic _heatindexF;
  dynamic _dewpointC;
  dynamic _dewpointF;
  dynamic _willItRain;
  dynamic _chanceOfRain;
  dynamic _willItSnow;
  dynamic _chanceOfSnow;
  dynamic _visKm;
  dynamic _visMiles;
  dynamic _gustMph;
  dynamic _gustKph;
  dynamic _uv;

  Hour(
      {dynamic timeEpoch,
      String? time,
      dynamic tempC,
      dynamic tempF,
      dynamic isDay,
      Condition? condition,
      dynamic windMph,
      dynamic windKph,
      dynamic windDegree,
      String? windDir,
      dynamic pressureMb,
      dynamic pressureIn,
      dynamic precipMm,
      dynamic precipIn,
      dynamic humidity,
      dynamic cloud,
      dynamic feelslikeC,
      dynamic feelslikeF,
      dynamic windchillC,
      dynamic windchillF,
      dynamic heatindexC,
      dynamic heatindexF,
      dynamic dewpointC,
      dynamic dewpointF,
      dynamic willItRain,
      dynamic chanceOfRain,
      dynamic willItSnow,
      dynamic chanceOfSnow,
      dynamic visKm,
      dynamic visMiles,
      dynamic gustMph,
      dynamic gustKph,
      dynamic uv}) {
    if (timeEpoch != null) {
      this._timeEpoch = timeEpoch;
    }
    if (time != null) {
      this._time = time;
    }
    if (tempC != null) {
      this._tempC = tempC;
    }
    if (tempF != null) {
      this._tempF = tempF;
    }
    if (isDay != null) {
      this._isDay = isDay;
    }
    if (condition != null) {
      this._condition = condition;
    }
    if (windMph != null) {
      this._windMph = windMph;
    }
    if (windKph != null) {
      this._windKph = windKph;
    }
    if (windDegree != null) {
      this._windDegree = windDegree;
    }
    if (windDir != null) {
      this._windDir = windDir;
    }
    if (pressureMb != null) {
      this._pressureMb = pressureMb;
    }
    if (pressureIn != null) {
      this._pressureIn = pressureIn;
    }
    if (precipMm != null) {
      this._precipMm = precipMm;
    }
    if (precipIn != null) {
      this._precipIn = precipIn;
    }
    if (humidity != null) {
      this._humidity = humidity;
    }
    if (cloud != null) {
      this._cloud = cloud;
    }
    if (feelslikeC != null) {
      this._feelslikeC = feelslikeC;
    }
    if (feelslikeF != null) {
      this._feelslikeF = feelslikeF;
    }
    if (windchillC != null) {
      this._windchillC = windchillC;
    }
    if (windchillF != null) {
      this._windchillF = windchillF;
    }
    if (heatindexC != null) {
      this._heatindexC = heatindexC;
    }
    if (heatindexF != null) {
      this._heatindexF = heatindexF;
    }
    if (dewpointC != null) {
      this._dewpointC = dewpointC;
    }
    if (dewpointF != null) {
      this._dewpointF = dewpointF;
    }
    if (willItRain != null) {
      this._willItRain = willItRain;
    }
    if (chanceOfRain != null) {
      this._chanceOfRain = chanceOfRain;
    }
    if (willItSnow != null) {
      this._willItSnow = willItSnow;
    }
    if (chanceOfSnow != null) {
      this._chanceOfSnow = chanceOfSnow;
    }
    if (visKm != null) {
      this._visKm = visKm;
    }
    if (visMiles != null) {
      this._visMiles = visMiles;
    }
    if (gustMph != null) {
      this._gustMph = gustMph;
    }
    if (gustKph != null) {
      this._gustKph = gustKph;
    }
    if (uv != null) {
      this._uv = uv;
    }
  }

  dynamic get timeEpoch => _timeEpoch;
  set timeEpoch(dynamic timeEpoch) => _timeEpoch = timeEpoch;
  String? get time => _time;
  set time(String? time) => _time = time;
  dynamic get tempC => _tempC;
  set tempC(dynamic tempC) => _tempC = tempC;
  dynamic get tempF => _tempF;
  set tempF(dynamic tempF) => _tempF = tempF;
  dynamic get isDay => _isDay;
  set isDay(dynamic isDay) => _isDay = isDay;
  Condition? get condition => _condition;
  set condition(Condition? condition) => _condition = condition;
  dynamic get windMph => _windMph;
  set windMph(dynamic windMph) => _windMph = windMph;
  dynamic get windKph => _windKph;
  set windKph(dynamic windKph) => _windKph = windKph;
  dynamic get windDegree => _windDegree;
  set windDegree(dynamic windDegree) => _windDegree = windDegree;
  String? get windDir => _windDir;
  set windDir(String? windDir) => _windDir = windDir;
  dynamic get pressureMb => _pressureMb;
  set pressureMb(dynamic pressureMb) => _pressureMb = pressureMb;
  dynamic get pressureIn => _pressureIn;
  set pressureIn(dynamic pressureIn) => _pressureIn = pressureIn;
  dynamic get precipMm => _precipMm;
  set precipMm(dynamic precipMm) => _precipMm = precipMm;
  dynamic get precipIn => _precipIn;
  set precipIn(dynamic precipIn) => _precipIn = precipIn;
  dynamic get humidity => _humidity;
  set humidity(dynamic humidity) => _humidity = humidity;
  dynamic get cloud => _cloud;
  set cloud(dynamic cloud) => _cloud = cloud;
  dynamic get feelslikeC => _feelslikeC;
  set feelslikeC(dynamic feelslikeC) => _feelslikeC = feelslikeC;
  dynamic get feelslikeF => _feelslikeF;
  set feelslikeF(dynamic feelslikeF) => _feelslikeF = feelslikeF;
  dynamic get windchillC => _windchillC;
  set windchillC(dynamic windchillC) => _windchillC = windchillC;
  dynamic get windchillF => _windchillF;
  set windchillF(dynamic windchillF) => _windchillF = windchillF;
  dynamic get heatindexC => _heatindexC;
  set heatindexC(dynamic heatindexC) => _heatindexC = heatindexC;
  dynamic get heatindexF => _heatindexF;
  set heatindexF(dynamic heatindexF) => _heatindexF = heatindexF;
  dynamic get dewpointC => _dewpointC;
  set dewpointC(dynamic dewpointC) => _dewpointC = dewpointC;
  dynamic get dewpointF => _dewpointF;
  set dewpointF(dynamic dewpointF) => _dewpointF = dewpointF;
  dynamic get willItRain => _willItRain;
  set willItRain(dynamic willItRain) => _willItRain = willItRain;
  dynamic get chanceOfRain => _chanceOfRain;
  set chanceOfRain(dynamic chanceOfRain) => _chanceOfRain = chanceOfRain;
  dynamic get willItSnow => _willItSnow;
  set willItSnow(dynamic willItSnow) => _willItSnow = willItSnow;
  dynamic get chanceOfSnow => _chanceOfSnow;
  set chanceOfSnow(dynamic chanceOfSnow) => _chanceOfSnow = chanceOfSnow;
  dynamic get visKm => _visKm;
  set visKm(dynamic visKm) => _visKm = visKm;
  dynamic get visMiles => _visMiles;
  set visMiles(dynamic visMiles) => _visMiles = visMiles;
  dynamic get gustMph => _gustMph;
  set gustMph(dynamic gustMph) => _gustMph = gustMph;
  dynamic get gustKph => _gustKph;
  set gustKph(dynamic gustKph) => _gustKph = gustKph;
  dynamic get uv => _uv;
  set uv(dynamic uv) => _uv = uv;

  Hour.fromJson(Map<String, dynamic> json) {
    _timeEpoch = json['time_epoch'];
    _time = json['time'];
    _tempC = json['temp_c'];
    _tempF = json['temp_f'];
    _isDay = json['is_day'];
    _condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    _windMph = json['wind_mph'];
    _windKph = json['wind_kph'];
    _windDegree = json['wind_degree'];
    _windDir = json['wind_dir'];
    _pressureMb = json['pressure_mb'];
    _pressureIn = json['pressure_in'];
    _precipMm = json['precip_mm'];
    _precipIn = json['precip_in'];
    _humidity = json['humidity'];
    _cloud = json['cloud'];
    _feelslikeC = json['feelslike_c'];
    _feelslikeF = json['feelslike_f'];
    _windchillC = json['windchill_c'];
    _windchillF = json['windchill_f'];
    _heatindexC = json['heatindex_c'];
    _heatindexF = json['heatindex_f'];
    _dewpointC = json['dewpoint_c'];
    _dewpointF = json['dewpoint_f'];
    _willItRain = json['will_it_rain'];
    _chanceOfRain = json['chance_of_rain'];
    _willItSnow = json['will_it_snow'];
    _chanceOfSnow = json['chance_of_snow'];
    _visKm = json['vis_km'];
    _visMiles = json['vis_miles'];
    _gustMph = json['gust_mph'];
    _gustKph = json['gust_kph'];
    _uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time_epoch'] = this._timeEpoch;
    data['time'] = this._time;
    data['temp_c'] = this._tempC;
    data['temp_f'] = this._tempF;
    data['is_day'] = this._isDay;
    if (this._condition != null) {
      data['condition'] = this._condition!.toJson();
    }
    data['wind_mph'] = this._windMph;
    data['wind_kph'] = this._windKph;
    data['wind_degree'] = this._windDegree;
    data['wind_dir'] = this._windDir;
    data['pressure_mb'] = this._pressureMb;
    data['pressure_in'] = this._pressureIn;
    data['precip_mm'] = this._precipMm;
    data['precip_in'] = this._precipIn;
    data['humidity'] = this._humidity;
    data['cloud'] = this._cloud;
    data['feelslike_c'] = this._feelslikeC;
    data['feelslike_f'] = this._feelslikeF;
    data['windchill_c'] = this._windchillC;
    data['windchill_f'] = this._windchillF;
    data['heatindex_c'] = this._heatindexC;
    data['heatindex_f'] = this._heatindexF;
    data['dewpoint_c'] = this._dewpointC;
    data['dewpoint_f'] = this._dewpointF;
    data['will_it_rain'] = this._willItRain;
    data['chance_of_rain'] = this._chanceOfRain;
    data['will_it_snow'] = this._willItSnow;
    data['chance_of_snow'] = this._chanceOfSnow;
    data['vis_km'] = this._visKm;
    data['vis_miles'] = this._visMiles;
    data['gust_mph'] = this._gustMph;
    data['gust_kph'] = this._gustKph;
    data['uv'] = this._uv;
    return data;
  }
}
