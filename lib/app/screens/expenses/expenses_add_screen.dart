import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_calculator/app/modules/expenses/bloc/expense_bloc.dart';
import 'package:smart_calculator/app/widgets/title_section_widget.dart';

import 'models/expenses_model.dart';

class ExpenseAddScreen extends StatefulWidget {
  const ExpenseAddScreen({Key? key}) : super(key: key);

  @override
  _ExpenseAddScreenState createState() => _ExpenseAddScreenState();
}

class _ExpenseAddScreenState extends State<ExpenseAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final List<String> _expenseType = ['Facture', 'Restaurant', 'Internet'];
  String _selectedLocation = 'Facture';

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
            "Ajout d'une dépense",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const TitleSectionWidget(
                  mainTitle: "Ajouter",
                  mainSubtitle: "une dépense",
                  starNb: 0,
                ),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: "Titre"),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 3) {
                      return 'Veuillez saisir un titre';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: "Prix"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Montant obligatoire ...';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Veuillez saisir un montant valide';
                    }
                    return null;
                  },
                ),
                DropdownButton(
                  hint: const Text('Veuillez choisir un type de dépense'),
                  // Not necessary for Option 1
                  value: _selectedLocation,

                  onChanged: (val) {
                    setState(() {
                      _selectedLocation = val.toString();
                    });
                  },
                  items: _expenseType.map((type) {
                    return DropdownMenuItem(
                      child: Text(type),
                      value: type,
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // Ajout d'un item
                      var item = ExpenseItem(name:_titleController.text,
                          date:DateTime.now(), amount:double.parse(_amountController.text),
                          type: _selectedLocation);

                      BlocProvider.of<ExpenseBloc>(context).add(AddExpenseItem(item));
                      _titleController.text = "";
                      _amountController.text = "";
                      // Message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "Dépense ${item.type}(${item.name}) d'un montant de ${item.amount.toStringAsFixed(2)} € ajoutée")),
                      );
                      Navigator.of(context).pop();

                    }
                  },
                  child: const Text('Valider'),
                ),
              ],
            ),
          ),
        ));
  }
}
