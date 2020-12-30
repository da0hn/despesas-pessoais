import 'package:despesas_pessoais/components/transaction_chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  TransactionChart(this._recentTransactions);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedTransactions.map((transactionDTO) {
            return Flexible(
              fit: FlexFit.tight,
              child: TransactionChartBar(
                percentage: _weekTotalValue == 0
                    ? 0.0
                    : (transactionDTO['value'] as double) / _weekTotalValue,
                value: transactionDTO['value'],
                label: transactionDTO['day'],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  double get _weekTotalValue {
    return _groupedTransactions.fold(0.0, (sum, transaction) {
      return (transaction['value'] as double) + sum;
    });
  }

  List<Map<String, Object>> get _groupedTransactions {
    return List.generate(7, (index) {
      final dayOfWeek = DateTime.now().subtract(
        Duration(days: index),
      );
      final dayOfWeekFormatted =
          DateFormat(DateFormat.ABBR_WEEKDAY, 'pt_BR').format(dayOfWeek);
      double totalInDay = 0.0;

      _recentTransactions.forEach((transaction) {
        final days = dayOfWeek.difference(transaction.date).inDays;
        final hours = dayOfWeek.difference(transaction.date).inHours;
        if (days == 0 && (hours >= 0 && hours <= 24)) {
          totalInDay += transaction.value;
        }
      });

      return {
        'day': dayOfWeekFormatted,
        'value': totalInDay,
      };
    }).reversed.toList();
  }
}
