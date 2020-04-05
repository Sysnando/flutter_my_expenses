import 'package:flutter/material.dart';

import '../widgets/transaction_chart.dart';
import '../widgets/transaction_list.dart';
import '../widgets/transaction_new.dart';

import '../models/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: '1', title: 'New Shoes', amount: 59.99, date: DateTime.now()),
    // Transaction(
    //     id: '2', title: 'Mc Donalds', amount: 11.00, date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String transactionTitle, double transactionAmount, DateTime transacationDate) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        date: transacationDate,
        title: transactionTitle,
        amount: transactionAmount);

    setState(() => _userTransactions.add(newTransaction));
  }

  void _startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionNew(_addNewTransaction);
        }
    );
  }

  void _deleteTransaction(String id) {
    setState((){
      _userTransactions.removeWhere((transaction) => transaction.id == id);
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startNewTransaction(context))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TransactionChart(_recentTransactions),
              TransactionList(_userTransactions, _deleteTransaction)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startNewTransaction(context),
        ));
  }
}
