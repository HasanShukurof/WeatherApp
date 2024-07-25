class WheatherModel {
  final String? tarix;
  final String? gun;
  final String? ikona;
  final String? tesviri;
  final String? status;
  final String? derece;
  final String? min;
  final String? maks;
  final String? gece;
  final String? rutubet;

  WheatherModel({
    this.tarix,
    this.gun,
    this.ikona,
    this.tesviri,
    this.status,
    this.derece,
    this.min,
    this.maks,
    this.gece,
    this.rutubet,
  });

  factory WheatherModel.fromJson(Map<String, dynamic> json) {
    return WheatherModel(
      tarix: json['date'] ?? '',
      gun: json['day'] ?? '',
      ikona: json['icon'] ?? '',
      tesviri: json['description'] ?? '',
      status: json['status'] ?? '',
      derece: json['degree'] ?? '',
      min: json['min'] ?? '',
      maks: json['max'] ?? '',
      gece: json['night'] ?? '',
      rutubet: json['humidity'] ?? '',
    );
  }
}
