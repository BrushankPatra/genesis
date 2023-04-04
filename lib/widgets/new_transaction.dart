import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTxn;

  NewTransaction(this.addNewTxn);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => addNewTxn, //not working in iOS
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              onSubmitted: (_) => addNewTxn, //not working in iOS
            ),
            TextButton(
              onPressed: () {
                print(titleController);
                addNewTxn(
                    titleController.text, int.parse(amountController.text));
              },
              child: Text(
                "Add Expense",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
