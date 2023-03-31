import "package:flutter/material.dart";

import "./transaction.dart";

import "package:intl/intl.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      title: "Expense Tracker",
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
  // String titleInput, amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
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
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountController,
                  ),
                  TextButton(
                    onPressed: () {
                      print(titleController);
                    },
                    child: Text(
                      "Add Expense",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((txn) {
              return Card(
                elevation: 5,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      child: Text(
                        "₹ ${txn.amount}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      decoration: BoxDecoration(color: Colors.indigo),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(txn.title,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          DateFormat("yMMMMEEEEd").format(txn.date),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
