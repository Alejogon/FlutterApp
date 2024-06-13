class Horoscopo {
  final Data data;
  final int status;
  final bool success;

  Horoscopo({
    required this.data,
    required this.status,
    required this.success,
  });

  factory Horoscopo.fromJson(Map<String, dynamic> json) => Horoscopo(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status,
        "success": success,
      };
}

class Data {
  final String date;
  final String horoscopeData;

  Data({
    required this.date,
    required this.horoscopeData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        date: json["date"],
        horoscopeData: json["horoscope_data"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "horoscope_data": horoscopeData,
      };
}
