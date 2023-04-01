import "package:flutter/material.dart";

import "./new_transaction.dart";
import "./transaction_list.dart";
import "../models/transaction.dart";

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String txnTitle, num txnAmount) {
    final newTxn = Transaction(
      title: txnTitle,
      amount: txnAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTxn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}
