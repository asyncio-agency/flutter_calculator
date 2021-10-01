import 'package:smart_calculator/app/screens/expenses/models/expenses_model.dart';

class ExpenseRepository {
  // Todo: Ajouter un localDatasourceProvider
  // Todo: Ajouter un remoteDatasourceProvider
  Future<List<ExpenseItem>> retrieve() async {
    List<ExpenseItem> entries = [
      ExpenseItem("Item 1", DateTime.now(), 145.0),
      ExpenseItem("Item 2", DateTime.now(), 90.0),
      ExpenseItem("Item 3", DateTime.now(), 80.0),
      ExpenseItem("Item 4", DateTime.now(), 200.0),
      ExpenseItem("Item 5", DateTime.now(), 12.0),
      ExpenseItem("Item 6", DateTime.now(), 999.0),
      ExpenseItem("Item 7", DateTime.now(), 98.0),
      ExpenseItem("Item 8", DateTime.now(), 100.0),
    ];
    return entries;
  }

  insert() {}

  delete() {}
}
