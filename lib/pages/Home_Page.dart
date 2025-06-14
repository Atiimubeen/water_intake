import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_intake/data/water_data.dart';
import 'package:water_intake/model/water_model.dart';
//import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePage> {
  final amountController = TextEditingController();

  @override
  void initState() {
    Provider.of<WaterData>(context, listen: false).getWater();
    super.initState();
  }

  void saveWater() {
    Provider.of<WaterData>(context, listen: false).addWater(
      WaterModel(
        amount: double.parse(amountController.text),
        dateTime: DateTime.now(),
        unit: 'ml',
      ),
    );

    if (!context.mounted) {
      return;
    }
  }

  void waterIntake() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Water"),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add your daily water intake"),
            SizedBox(height: 10),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("cancel"),
          ),
          TextButton(
            onPressed: () {
              saveWater();
              Navigator.of(context).pop();
            },
            child: Text("save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WaterData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(elevation: 4, centerTitle: true, title: Text("Water")),
        body: ListView.builder(
          itemCount: value.waterDateList.length,
          itemBuilder: (context, index) {
            final waterModel = value.waterDateList[index];
            return ListTile(title: Text(waterModel.amount.toString()));
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: waterIntake,
        ),
      ),
    );
  }
}
