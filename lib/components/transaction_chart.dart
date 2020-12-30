import 'package:despesas_pessoais/components/transaction_chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> _recenteTransactions;

  TransactionChart(this._recenteTransactions);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: _groupedTransactions.map((e) {
          return TransactionChartBar(
            percentage: 0.9,
            value: e['value'],
            label: e['day'],
          );
        }).toList(),
      ),
    );
  }

  List<Map<String, Object>> get _groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      final initialLetter = DateFormat.E().format(weekDay)[0];

      final totalSum = _recenteTransactions
          .where((transaction) =>
              DateTime.now().difference(transaction.date).inDays < 7)
          .map((transaction) => transaction.value)
          .reduce((sum, value) => sum + value);

      return {
        'day': initialLetter,
        'value': totalSum,
      };
    });
  }
}
