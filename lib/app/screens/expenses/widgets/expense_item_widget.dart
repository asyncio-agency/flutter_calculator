import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItemWidget extends StatelessWidget {
  final String name;
  final DateTime date;
  final double amount;

  const ExpenseItemWidget(
      {Key? key, required this.name, required this.date, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 3.0, color: Colors.grey),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: amount < 100 ? Colors.black : Colors.amber[600]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  DateFormat('dd MMM yyyy kk:mm').format(date),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: amount < 100 ? Colors.black : Colors.amber[600]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  amount.toString(),
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -5,
                      color: amount < 100 ? Colors.black : Colors.amber[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
