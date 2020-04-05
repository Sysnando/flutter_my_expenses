import 'package:flutter/material.dart';

import '../models/currency.dart';

class TransactionChartBar extends StatelessWidget {
  final label;
  final spendingAmount;
  final spendingAmountPct;

  TransactionChartBar(this.label, this.spendingAmount, this.spendingAmountPct);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
            child: FittedBox(child: Text(Currency(spendingAmount).get(0))),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingAmountPct,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(label.toString().substring(0, 1))
        ],
      ),
    );
  }
}
