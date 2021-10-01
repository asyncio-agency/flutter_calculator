import 'package:dio/dio.dart';
import 'package:smart_calculator/app/modules/expenses/data/provider/expense_local_datasource.dart';
import 'package:smart_calculator/app/modules/expenses/data/provider/expense_remote_datasource.dart';
import 'package:smart_calculator/app/screens/expenses/models/expenses_model.dart';

class ExpenseRepository {
  // Todo: Ajouter un localDatasourceProvider

  final ExpenseRemoteDatasource expenseRemoteDatasource =
      ExpenseRemoteDatasource();
  final ExpenseLocalDatasource expenseLocalDatasource =
      ExpenseLocalDatasource();

  Future<List<ExpenseItem>> retrieve() async {
    try {
      //throw Exception("404");
      var entries = await expenseRemoteDatasource.get();
      await expenseLocalDatasource.store(entries);
      return entries;
    } catch (e) {
      try {
        print("Error internet ...");
        return await expenseLocalDatasource.retrieve();
      } catch (cacheErr) {
        rethrow;
      }
    }
  }

  insert() {}

  delete() {}
}
