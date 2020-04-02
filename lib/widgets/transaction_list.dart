import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../models/currency.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transation added yet',
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 20,
                ),
                //Image.asset('assets/images/waiting.png', fit: BoxFit.cover,) not work because it takes the bounderes of the widget Column, but the Column don't have boundaries
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
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
                              color: Theme.of(context).primaryColor, width: 2)),
                      padding: EdgeInsets.all(7),
                      child: Text(Currency(transactions[index].amount).get(),
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(transactions[index].title,
                            style: Theme.of(context).textTheme.title),
                        Text(
                            DateFormat.yMMMMd()
                                .add_Hm()
                                .format(transactions[index].date),
                            style: TextStyle(color: Colors.grey, fontSize: 12))
                      ],
                    )
                  ],
                ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
