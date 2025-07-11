//import 'package:flutter/services.dart';
import 'package:water_intake/bars/individual_bar.dart';

class BarData {
  final double sunWaterAmt;
  final double monWaterAmt;
  final double tueWaterAmt;
  final double wedWaterAmt;
  final double thurWaterAmt;
  final double friWaterAmt;
  final double satWaterAmt;

  BarData({
    required this.sunWaterAmt,
    required this.monWaterAmt,
    required this.tueWaterAmt,
    required this.wedWaterAmt,
    required this.thurWaterAmt,
    required this.friWaterAmt,
    required this.satWaterAmt,
  });

  List<IndividualBar> barData = [];

  void initBarData() {
    barData = [
      IndividualBar(x: 0, y: sunWaterAmt),
      IndividualBar(x: 2, y: monWaterAmt),
      IndividualBar(x: 3, y: tueWaterAmt),
      IndividualBar(x: 4, y: wedWaterAmt),
      IndividualBar(x: 5, y: thurWaterAmt),
      IndividualBar(x: 6, y: friWaterAmt),
      IndividualBar(x: 7, y: satWaterAmt),
    ];
  }
}
