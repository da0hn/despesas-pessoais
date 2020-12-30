import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? _noTransactionFound(context)
          : _transactionList(context),
    );
  }

  Widget _transactionList(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (_, index) {
        final transaction = transactions[index];
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 8,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 35,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(
                    'R\$${transaction.value.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              transaction.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              DateFormat('d MMM y', 'pt_BR').format(transaction.date),
            ),
          ),
        );
      },
    );
  }

  Widget _noTransactionFound(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Nenhuma transação cadastrada!',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 20),
        Container(
          height: 200,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.fitHeight,
          ),
        )
      ],
    );
  }
}
