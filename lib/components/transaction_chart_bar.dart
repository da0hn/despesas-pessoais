import 'package:flutter/material.dart';

class TransactionChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  TransactionChartBar({
    this.percentage,
    this.value,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text('${this.value.toStringAsFixed(2)}'),
        ),
        SizedBox(height: 5),
        _bar(),
        SizedBox(height: 5),
        Text(this.label),
      ],
    );
  }

  Widget _bar() {
    return Container(
      height: 60,
      width: 10,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurpleAccent,
                width: 1.0,
              ),
              color: Color(0xFF91C593),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          FractionallySizedBox(
            heightFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
