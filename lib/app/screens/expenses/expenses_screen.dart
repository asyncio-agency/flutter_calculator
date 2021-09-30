import 'package:flutter/material.dart';
import 'package:smart_calculator/app/screens/expenses/models/expenses_model.dart';
import 'package:smart_calculator/app/screens/expenses/widgets/expense_item_widget.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  List<ExpenseItem> entries = [];

  @override
  void initState() {
    entries = [
      ExpenseItem("Item 1", DateTime.now(), 145.0),
      ExpenseItem("Item 2", DateTime.now(), 90.0),
      ExpenseItem("Item 3", DateTime.now(), 80.0),
      ExpenseItem("Item 4", DateTime.now(), 200.0),
      ExpenseItem("Item 5", DateTime.now(), 12.0),
      ExpenseItem("Item 6", DateTime.now(), 999.0),
      ExpenseItem("Item 7", DateTime.now(), 98.0),
      ExpenseItem("Item 8", DateTime.now(), 100.0),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Historique de dépenses",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpenseItemWidget(
              name: entries[index].name,
              date: entries[index].date,
              amount: entries[index].amount,
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/expenses-add');
        },
      ),
    );
  }
}
