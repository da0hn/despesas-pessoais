import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/transaction_user.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.deepPurpleAccent,
              elevation: 5,
              child: Text('Gráfico'),
            ),
          ),
          TransactionUser(),
        ],
      ),
    );
  }
}
