import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../entity/transaction.dart';
import '../entity/currency.dart';

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'New Shoes', amount: 59.99, date: DateTime.now()),
    Transaction(id: '2', title: 'Mc Donalds', amount: 11.00, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses APP')        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('CHART'),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),),
                FlatButton(
                  textColor: Colors.purple,
                  child: Text('Add Transaction'),
                  onPressed: () {},
                )
              ],),
            ) 
          ,),
          Column(children: transactions.map((tx) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2
                      )
                    ),
                    padding: EdgeInsets.all(7),
                    child: Text(
                      Currency(tx.amount).get(),
                      style: TextStyle(
                        color: Colors.purple                        
                      )
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        DateFormat.yMMMMd().add_Hm().format(tx.date),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12 
                        )
                      )
                    ],
                  )
                ],
              )
            );
          }).toList())
        ],
      )
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter App'),
//       ),
//       body: Center(
//         child: Text('Widget Playground!'),
//       ),
//     );
//   }
// }