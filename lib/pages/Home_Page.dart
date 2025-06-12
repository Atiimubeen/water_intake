import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePage> {
  final amountController = TextEditingController();
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
              // add here the database
            },
            child: Text("save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 4, centerTitle: true, title: Text("Water")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: waterIntake,
      ),
    );
  }
}
