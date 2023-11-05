class MarineForecastData {
  final MarineForecast marine;
  MarineForecastData({required this.marine});

  factory MarineForecastData.fromJson(Map<String, dynamic> json) =>
      MarineForecastData(marine: MarineForecast.fromJson(json['current']));
}

class CurrentUnits {
	String? time;
	String? interval;
	String? waveHeight;

	CurrentUnits({this.time, this.interval, this.waveHeight});

	factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
				time: json['time'] as String?,
				interval: json['interval'] as String?,
				waveHeight: json['wave_height'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'time': time,
				'interval': interval,
				'wave_height': waveHeight,
			};
}
class Current {
	String? time;
	int? interval;
	double? waveHeight;

	Current({this.time, this.interval, this.waveHeight});

	factory Current.fromJson(Map<String, dynamic> json) => Current(
				time: json['time'] as String?,
				interval: json['interval'] as int?,
				waveHeight: (json['wave_height'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'time': time,
				'interval': interval,
				'wave_height': waveHeight,
			};
}

class HourlyUnits {
	String? time;
	String? waveHeight;

	HourlyUnits({this.time, this.waveHeight});

	factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
				time: json['time'] as String?,
				waveHeight: json['wave_height'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'time': time,
				'wave_height': waveHeight,
			};
}

class Hourly {
	List<String>? time;
	List<dynamic>? waveHeight;

	Hourly({this.time, this.waveHeight});

	factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: (json['time'] as List<dynamic>?)?.map((item) => item as String).toList(),

				waveHeight: json['wave_height'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'time': time,
				'wave_height': waveHeight,
			};
}

class MarineForecast {
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

	MarineForecast({
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

	factory MarineForecast.fromJson(Map<String, dynamic> json) {
		return MarineForecast(
			latitude: json['latitude'] as double?,

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
