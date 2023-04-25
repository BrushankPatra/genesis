import "package:flutter/material.dart";

import "../models/transaction.dart";

import "package:intl/intl.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTxn;

  TransactionList(this.transactions, this.deleteTxn);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: [
                Image.asset("assets/images/add_transaction.png"),
                Text(
                  "NO EXPENSES ADDED YET",
                  style: TextStyle(fontFamily: "Raleway"),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (cntxt, index) {
                return Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        child: Text(
                          "₹ ${transactions[index].amount}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(transactions[index].title,
                              style: Theme.of(context).textTheme.titleLarge),
                          Text(
                            DateFormat("yMMMMEEEEd")
                                .format(transactions[index].date),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => deleteTxn(transactions[index].id),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
