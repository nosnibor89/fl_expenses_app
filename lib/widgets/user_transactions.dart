import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  // final List<Transaction> _transactions = [
  //   Transaction(
  //       id: 't1',
  //       title: 'Buy notebook stand',
  //       amount: 40.5,
  //       date: DateTime.now()),
  //   Transaction(id: 't2', title: 'Big Mac', amount: 12.99, date: DateTime.now())
  // ];
    final List<Transaction> _transactions = [
    Transaction(
        id: 't1',
        title: 'Buy notebook stand',
        amount: 40.5,
        date: DateTime.now()),
    Transaction(id: 't2', title: 'Big Mac', amount: 12.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Netflix', amount: 12.99, date: DateTime.now())
  ];
    // final List<Transaction> _transactions = [ ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(10),
            child: NewTransaction(
              onPressed: addTransaction,
            )),
        TransactionList(_transactions)
      ],
    );
  }

  void addTransaction(String _title, double _amount) {
    final tx = Transaction(
        id: DateTime.now().toString(),
        title: _title,
        amount: _amount,
        date: DateTime.now());

    setState(() {
      _transactions.add(tx);
    });
  }
}
