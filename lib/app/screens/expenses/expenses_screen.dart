import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_calculator/app/modules/expenses/bloc/expense_bloc.dart';
import 'package:smart_calculator/app/screens/expenses/models/expenses_model.dart';
import 'package:smart_calculator/app/screens/expenses/widgets/expense_item_widget.dart';
import 'package:after_layout/after_layout.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen>
    with AfterLayoutMixin<ExpensesScreen> {
  List<ExpenseItem> entries = [];

  @override
  void afterFirstLayout(BuildContext context) {
    // Calling the same function "after layout" to resolve the issue.
    BlocProvider.of<ExpenseBloc>(context).add(LoadExpenseItems());
  }

  _refresh() {
    BlocProvider.of<ExpenseBloc>(context).add(LoadExpenseItems());
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
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/expenses-add'),
              icon: const Icon(Icons.add, color: Colors.black))
        ],
        title: const Text(
          "Historique de dépenses",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _refresh();
        },
        child:
            BlocConsumer<ExpenseBloc, ExpenseState>(listener: (context, state) {
          if (state is ExpenseItemsError) {
            const snackBar =
                SnackBar(content: Text('Erreur de chargement ...'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }, builder: (context, state) {
          if (state is ExpenseItemsLoaded) {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: state.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpenseItemWidget(
                    name: state.items[index].name,
                    date: state.items[index].date,
                    amount: state.items[index].amount,
                    type: state.items[index].type,
                  );
                });
          } else if (state is ExpenseItemsLoading) {
            return const Text("Chargement en cours ...");
          } else {
            return const Text("Pas de données");
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          _refresh();
          //Navigator.pushNamed(context, '/expenses-add');
        },
      ),
    );
  }
}
