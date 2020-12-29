import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (_, index) {
          final transaction = transactions[index];
          return Card(
            child: Row(
              children: [
                Container(
                  child: Text(
                    'R\$ ${transaction.value.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepOrange,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purpleAccent,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Text(
                      DateFormat('dd MMM yyyy').format(transaction.date),
                      style: TextStyle(
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
