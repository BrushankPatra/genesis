import "package:flutter/material.dart";

import "../models/transaction.dart";
import "../widgets/chart_bar.dart";

import "package:intl/intl.dart";

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum,
      };
    });
  }

  int get weeklySpending {
    return groupedTransactionValues.fold(0, (sum, item) {
      return sum + item["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data["day"],
                data["amount"],
                weeklySpending == 0
                    ? 0
                    : (data["amount"] as int) / weeklySpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
