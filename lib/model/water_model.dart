class WaterModel {
  final String? id;
  final double amount;
  final DateTime dateTime;
  final String unit;

  WaterModel({
    this.id,
    required this.amount,
    required this.dateTime,
    required this.unit,
  });

  factory WaterModel.fromJosn(Map<String, dynamic> json, String id) {
    return WaterModel(
      amount: json['amount'],
      dateTime: DateTime.parse(json['dateTime']),
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'dateTime': DateTime.now, 'unit': unit};
  }
}
