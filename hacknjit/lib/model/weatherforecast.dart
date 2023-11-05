class WeatherForecastData {
  final WeatherForecast weather;
  WeatherForecastData({required this.weather});
  factory WeatherForecastData.fromJson(Map<String, dynamic> json) =>
      WeatherForecastData(weather: WeatherForecast.fromJson(json['current']));
}

class CurrentUnits {
	String? time;
	String? interval;
	String? temperature2m;
	String? windspeed10m;

	CurrentUnits({
		this.time, 
		this.interval, 
		this.temperature2m, 
		this.windspeed10m, 
	});

	factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
				time: json['time'] as String?,
				interval: json['interval'] as String?,
				temperature2m: json['temperature_2m'] as String?,
				windspeed10m: json['windspeed_10m'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'time': time,
				'interval': interval,
				'temperature_2m': temperature2m,
				'windspeed_10m': windspeed10m,
			};
}

class Current {
	String? time;
	int? interval;
	double? temperature2m;
	double? windspeed10m;

	Current({
		this.time, 
		this.interval, 
		this.temperature2m, 
		this.windspeed10m, 
	});

	factory Current.fromJson(Map<String, dynamic> json) => Current(
				time: json['time'] as String?,
				interval: json['interval'] as int?,
				temperature2m: (json['temperature_2m'] as num?)?.toDouble(),
				windspeed10m: (json['windspeed_10m'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'time': time,
				'interval': interval,
				'temperature_2m': temperature2m,
				'windspeed_10m': windspeed10m,
			};
}

class HourlyUnits {
	String? time;
	String? temperature2m;
	String? windspeed10m;

	HourlyUnits({this.time, this.temperature2m, this.windspeed10m});

	factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
				time: json['time'] as String?,
				temperature2m: json['temperature_2m'] as String?,
				windspeed10m: json['windspeed_10m'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'time': time,
				'temperature_2m': temperature2m,
				'windspeed_10m': windspeed10m,
			};
}

class Hourly {
	List<String>? time;
	List<num>? temperature2m;
	List<num>? windspeed10m;

Hourly({this.time, this.temperature2m, this.windspeed10m});

	factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
				// time: json['time'] as List<String>?,
        time: (json['time'] as List<dynamic>?)?.map((item) => item as String).toList(),
				// temperature2m: json['temperature_2m'] as List<num>?,
				// windspeed10m: json['windspeed_10m'] as List<num>?,
        temperature2m: (json['temperature_2m'] as List<dynamic>?)?.map((item) => item as num).toList(),
        windspeed10m: (json['windspeed_10m'] as List<dynamic>?)?.map((item) => item as num).toList(),
			);

	Map<String, dynamic> toJson() => {
				'time': time,
				'temperature_2m': temperature2m,
				'windspeed_10m': windspeed10m,
			};
}

class WeatherForecast {
	double? latitude;
	double? longitude;
	double? generationtimeMs;
	int? utcOffsetSeconds;
	String? timezone;
	String? timezoneAbbreviation;
	double? elevation;
	CurrentUnits? currentUnits;
	Current? current;
	HourlyUnits? hourlyUnits;
	Hourly? hourly;

	WeatherForecast({
		this.latitude, 
		this.longitude, 
		this.generationtimeMs, 
		this.utcOffsetSeconds, 
		this.timezone, 
		this.timezoneAbbreviation, 
		this.elevation, 
		this.currentUnits, 
		this.current, 
		this.hourlyUnits, 
		this.hourly, 
	});

	factory WeatherForecast.fromJson(Map<String, dynamic> json) {
		return WeatherForecast(
			latitude: (json['latitude'] as num?)?.toDouble(),
			longitude: (json['longitude'] as num?)?.toDouble(),
			generationtimeMs: (json['generationtime_ms'] as num?)?.toDouble(),
			utcOffsetSeconds: json['utc_offset_seconds'] as int?,
			timezone: json['timezone'] as String?,
			timezoneAbbreviation: json['timezone_abbreviation'] as String?,
			elevation: json['elevation'] as double?,
			currentUnits: json['current_units'] == null
						? null
						: CurrentUnits.fromJson(json['current_units'] as Map<String, dynamic>),
			current: json['current'] == null
						? null
						: Current.fromJson(json['current'] as Map<String, dynamic>),
			hourlyUnits: json['hourly_units'] == null
						? null
						: HourlyUnits.fromJson(json['hourly_units'] as Map<String, dynamic>),
			hourly: json['hourly'] == null
						? null
						: Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
		);
	}




	Map<String, dynamic> toJson() => {
				'latitude': latitude,
				'longitude': longitude,
				'generationtime_ms': generationtimeMs,
				'utc_offset_seconds': utcOffsetSeconds,
				'timezone': timezone,
				'timezone_abbreviation': timezoneAbbreviation,
				'elevation': elevation,
				'current_units': currentUnits?.toJson(),
				'current': current?.toJson(),
				'hourly_units': hourlyUnits?.toJson(),
				'hourly': hourly?.toJson(),
			};
}
