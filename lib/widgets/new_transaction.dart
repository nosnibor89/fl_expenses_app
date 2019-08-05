import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function(String, double) onPressed;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({this.onPressed});

  void submit() {
    final inputTitle = titleController.text;
    final inputAmount = double.tryParse(amountController.text);

    if (inputTitle.isEmpty || inputAmount == null || inputAmount <= 0) {
      print("invalid input");
      return;
    }

    onPressed(inputTitle, inputAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submit(),
          ),
          FlatButton(
            child: Text('Add transaction'),
            textColor: Colors.purple,
            onPressed: submit,
          )
        ],
      ),
    );
  }
}
