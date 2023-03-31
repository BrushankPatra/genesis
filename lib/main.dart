import "package:flutter/material.dart";

import "./transaction.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      title: "Expense App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "MK1",
      title: "New iPhone 14 Pro",
      amount: 123000,
      date: DateTime.now(),
    ),
    Transaction(
      id: "MK2",
      title: "New Galaxy S23",
      amount: 80000,
      date: DateTime.now(),
    ),
    Transaction(
      id: "MK3",
      title: "Chargers and Cases",
      amount: 4000,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.amber[200],
              child: Text("CHART!"),
            ),
          ),
          Container(
            child: Card(
              color: Colors.green[200],
              child: Text("LIST OF TRANSACTIONS!"),
            ),
          ),
        ],
      ),
    );
  }
}
