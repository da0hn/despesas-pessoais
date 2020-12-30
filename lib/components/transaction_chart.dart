import 'package:despesas_pessoais/components/transaction_chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
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
          children: _groupedTransactions.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: TransactionChartBar(
                percentage: (e['value'] as double) / _weekTotalValue,
                value: e['value'],
                label: e['day'],
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
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      initializeDateFormatting('pt_BR', null);
      final initialLetter =
          DateFormat(DateFormat.ABBR_WEEKDAY, 'pt_BR').format(weekDay);
      double totalInDay = 0.0;

      _recentTransactions.forEach((transaction) {
        final days = weekDay.difference(transaction.date).inDays;
        final hours = weekDay.difference(transaction.date).inHours;
        if (days == 0 && (hours >= 0 && hours <= 24)) {
          totalInDay += transaction.value;
        }
      });

      return {
        'day': initialLetter,
        'value': totalInDay,
      };
    }).reversed.toList();
  }
}
