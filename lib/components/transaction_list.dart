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
      child: transactions.isEmpty
          ? _noTransactionFound(context)
          : _transactionList(context),
    );
  }

  ListView _transactionList(BuildContext context) {
    return ListView.builder(
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
                    color: Theme.of(context).primaryColor,
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
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    DateFormat('dd MMM yyyy').format(transaction.date),
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Column _noTransactionFound(BuildContext context) {
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
