import "./widgets/user_transaction.dart";
import "package:flutter/material.dart";

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.amber[200],
                child: Text("CHART!"),
              ),
            ),
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
