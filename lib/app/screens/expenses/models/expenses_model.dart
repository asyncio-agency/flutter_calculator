class ExpenseItem {
  final String name;
  final DateTime date;
  final double amount;
  final String? type;

  ExpenseItem(
      {required this.name,
      required this.date,
      required this.amount,
      this.type});

  factory ExpenseItem.fromJson(Map<String, dynamic> data) {
    return ExpenseItem(
      name: data['name'],
      date: DateTime.parse(data['date']),
      amount: double.tryParse(data['amount'].toString()) ?? 0,
      type: data['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "date": this.date.toIso8601String(),
      "amount": this.amount,
      "type": this.type
    };
  }
}
