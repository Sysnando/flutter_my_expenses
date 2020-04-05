import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/transaction_chart_bar.dart';

import '../models/transaction.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  TransactionChart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      // for(var i = 0; i < recentTransactions.length ; i++) {
      for (var transaction in recentTransactions)
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year)
          totalSum += transaction.amount;

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionsValue.fold(0.0, (acc, item) {
      return acc + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionsValue);

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionsValue.map((data) {
          return Flexible(
              fit: FlexFit.tight,
              child: TransactionChartBar(
                data['day'], 
                data['amount'],
                totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending)
          );
        }).toList(),
      ),
    );
  }
}
