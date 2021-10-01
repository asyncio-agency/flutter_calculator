import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:smart_calculator/app/screens/expenses/models/expenses_model.dart';

class ExpenseLocalDatasource {

  Future<void> store(List<ExpenseItem> items) async{
    // Ecrire sur un fichier
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    final file = File('${appDocPath}/calculator_cache_expenses');
    var data = items.map((e) => e.toJson()).toList();
    print("DATA : ${data}");
    await file.writeAsString(jsonEncode(data));
  }

  Future<List<ExpenseItem>> retrieve() async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    final file = File('${appDocPath}/calculator_cache_expenses');
    var items = await json.decode(await file.readAsString());
    var data = items.map((e) => e.fromJson(items)).toList();
    return json.decode(data);
  }

  Future<void> clear(List<ExpenseItem> items) async{
    // Supression
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    final file = File('${appDocPath}/calculator_cache_expenses');
    file.delete();
  }
}
