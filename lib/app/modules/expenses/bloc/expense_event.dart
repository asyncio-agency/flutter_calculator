part of 'expense_bloc.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();
}

class AddExpenseItem extends ExpenseEvent {
  final ExpenseItem item;

  const AddExpenseItem(this.item);

  @override
  List<Object?> get props => [item];
}

class LoadExpenseItems extends ExpenseEvent {
  @override
  List<Object?> get props => [];
}
