import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_calculator/app/modules/expenses/data/repository/expense_repository.dart';
import 'package:smart_calculator/app/screens/expenses/models/expenses_model.dart';

part 'expense_event.dart';

part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository expenseRepository = ExpenseRepository();

  ExpenseBloc() : super(ExpenseInitial());

  @override
  Stream<ExpenseState> mapEventToState(ExpenseEvent event) async* {
    if (event is LoadExpenseItems) {
      if (state is ExpenseItemsLoaded) {
        var oldState = state as ExpenseItemsLoaded;
        List<ExpenseItem> results = oldState.items;
        yield ExpenseItemsLoaded(results);
      }
      yield ExpenseItemsLoading();

      try {
        // Traitement de récupération
        var results = await expenseRepository.retrieve();
        await Future.delayed(const Duration(seconds: 2));
        yield ExpenseItemsLoaded(results);
      } catch (e) {
        yield ExpenseItemsError(e);
      }
    } else if (event is AddExpenseItem) {
      if (state is ExpenseItemsLoaded) {
        var oldState = state as ExpenseItemsLoaded;
        yield ExpenseItemsLoading();
        yield ExpenseItemsLoaded([event.item, ...oldState.items]);
      }
    }
  }
}
