part of 'expense_bloc.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();
}

class ExpenseInitial extends ExpenseState {
  @override
  List<Object> get props => [];
}

class ExpenseItemsLoaded extends ExpenseState {
  final List<ExpenseItem> items;

  const ExpenseItemsLoaded(this.items);

  @override
  List<Object> get props => [];
}

class ExpenseItemsLoading extends ExpenseState {
  @override
  List<Object> get props => [];
}

class ExpenseItemsError extends ExpenseState {
  final dynamic error;

  const ExpenseItemsError(this.error);

  @override
  List<Object> get props => [];
}
