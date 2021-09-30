import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    if (value == null || value.isEmpty) {
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
                      return 'saisie obligatoire ...';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Veuillez saisir un prix';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // Ajout d'un item
                      var item = ExpenseItem(_titleController.text, DateTime.now(), double.parse(_amountController.text));
                      // Message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Ajout de ${item.name} en cours ...')),
                      );
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
