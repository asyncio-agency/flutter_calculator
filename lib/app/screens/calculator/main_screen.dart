import 'package:flutter/material.dart';
import 'package:smart_calculator/app/screens/calculator/widgets/calculator_btn_widget.dart';
import 'package:smart_calculator/app/screens/calculator/widgets/calculator_result_widget.dart';
import 'package:function_tree/function_tree.dart';

class MainScreen extends StatefulWidget {
  final String title;

  const MainScreen({Key? key, required this.title}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Map<int, List<String>> calculator = {
    0: ['C', '(', ')', '/'],
    1: ['7', '8', '9', 'X'],
    2: ['4', '5', '6', '-'],
    3: ['1', '2', '3', '+'],
    4: ['0', '.', '='],
  };

  String _calculatorOperation = "";
  String _calculatorResult = "0";

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  _showErrorMsg(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Erreur : ...'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 1),
    ));
  }

  _calculate(String val) {
    var specialOpe = ['C', '=', 'X'];
    if (!specialOpe.contains(val)) {
      setState(() {
        if (_calculatorOperation == "Pas d'opération") {
          _calculatorOperation = val;
        } else {
          _calculatorOperation = _calculatorOperation + val;
        }
      });
    } else {
      switch (val) {
        case "C":
          setState(() {
            _calculatorOperation = "Pas d'opération";
            _calculatorResult = "0";
          });
          break;
        case "X":
          setState(() {
            _calculatorOperation = _calculatorOperation + "*";
          });
          break;
        case "=":
          setState(() {
            if (double.tryParse(_calculatorResult) == 0) {
              _calculatorResult = "${_calculatorOperation.interpret()}";
              _calculatorOperation = _calculatorResult;
            } else {
              _showErrorMsg(context);
            }
          });
          break;
      }
    }
  }

  @override
  void initState() {
    _calculatorOperation = "Pas d'opération";
    _calculatorResult = "0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/expenses');
                  },
                  child: const Icon(
                    Icons.save,
                    color: Colors.black,
                  ),
                )),
          ],
        ),
        body: Column(
          children: [
            CalculatorScreenWidget(
              operation: _calculatorOperation,
              result: double.parse(_calculatorResult),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Boucle for
                  SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CalculatorBtnWidget(
                          operationBtn: true,
                          value: "C",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: true,
                          value: "(",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: true,
                          value: ")",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: true,
                          value: "/",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CalculatorBtnWidget(
                          operationBtn: false,
                          value: "7",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: false,
                          value: "8",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: false,
                          value: "9",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: true,
                          value: "X",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CalculatorBtnWidget(
                          operationBtn: false,
                          value: "4",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: false,
                          value: "5",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: false,
                          value: "6",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: true,
                          value: "-",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CalculatorBtnWidget(
                          operationBtn: false,
                          value: "1",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: false,
                          value: "2",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: false,
                          value: "3",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: true,
                          value: "+",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CalculatorBtnWidget(
                          operationBtn: false,
                          value: "0",
                          btnWidth: 193,
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: false,
                          value: ".",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                        CalculatorBtnWidget(
                          operationBtn: true,
                          value: "=",
                          onClick: (value) {
                            _calculate(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
