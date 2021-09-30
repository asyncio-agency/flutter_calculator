import 'package:flutter/material.dart';

class CalculatorBtnWidget extends StatelessWidget {
  final bool operationBtn;
  final String value;
  final Function? onClick;
  final double btnWidth;

  const CalculatorBtnWidget(
      {Key? key,
      this.onClick,
      required this.operationBtn,
      required this.value,
      this.btnWidth = 95})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        if (onClick != null) {
          onClick!(value);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: operationBtn ? Colors.deepOrange : Colors.grey,
        ),
        alignment: Alignment.center,
        width: btnWidth,
        height: 78,
        child: Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24)
        ),
      ),
    );
  }
}
