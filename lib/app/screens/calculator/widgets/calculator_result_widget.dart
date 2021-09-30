import 'package:flutter/material.dart';

class CalculatorScreenWidget extends StatelessWidget {
  final String operation;
  final double result;

  const CalculatorScreenWidget(
      {Key? key, this.operation = "Pas d'opération", this.result = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 22, top: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                operation,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 22, top: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                result.toString(),
                style:
                    const TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
