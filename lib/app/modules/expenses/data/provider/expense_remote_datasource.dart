import 'package:dio/dio.dart';
import 'package:smart_calculator/app/screens/expenses/models/expenses_model.dart';

class ExpenseRemoteDatasource {
  final Dio _myDio = Dio(
    BaseOptions(
      baseUrl: "http://demo5441137.mockable.io"
    )
  );

  Future<List<ExpenseItem>> get() async {
    try {
      var response = await _myDio
          .get<List<dynamic>>("/expenses");
      //print(response.data!.map((e) => ExpenseItem.fromJson(e)).toList());
      return response.data!.map((e) => ExpenseItem.fromJson(e)).toList();
    } catch (e) {
      //print(e);
      return [];
    }
  }

  post() {}
}
