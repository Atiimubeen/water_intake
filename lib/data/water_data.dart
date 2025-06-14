import 'package:flutter/widgets.dart';
import 'package:water_intake/model/water_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WaterData extends ChangeNotifier {
  List<WaterModel> waterDateList = [];

  // add the water
  void addWater(WaterModel water) async {
    final url = Uri.https(
      'water-intake-dfa17-default-rtdb.firebaseio.com',
      'water.json',
    );

    var response = await http.post(
      url,
      headers: {'content': 'application/json'},
      body: json.encode({
        'amount': double.parse(water.amount.toString()),
        'unit': 'ml',
        'dateTime': DateTime.now().toString(),
      }),
    );

    if (response.statusCode == 200) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      waterDateList.add(
        WaterModel(
          id: extractedData['name'],
          amount: water.amount,
          dateTime: water.dateTime,
          unit: 'ml',
        ),
      );
    } else {
      print("Error occured${response.statusCode}");
    }
    notifyListeners();
  }

  Future<List<WaterModel>> getWater() async {
    final url = Uri.https(
      'water-intake-dfa17-default-rtdb.firebaseio.com',
      'water.json',
    );
    final response = await http.get(url);

    if (response.statusCode == 200 && response.body != 'null') {
      waterDateList.clear();
      final extractDate = json.decode(response.body) as Map<String, dynamic>;

      for (var element in extractDate.entries) {
        waterDateList.add(
          WaterModel(
            amount: element.value['amount'],
            dateTime: DateTime.parse(element.value['dateTime']),
            unit: element.value['unit'],
          ),
        );
      }
    }
    notifyListeners();
    return waterDateList;
  }
}
