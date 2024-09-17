import 'package:flutter/cupertino.dart';
import 'package:myapp/model/transaction.dart';

class TransactionsProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  double getDoubleIncome() {
    return _transactions
        .where((element) =>
            element.type ==
            TransactionType
                .income) //filtramos solo este tipo de transacciones, Retorna un nuevo iterable con solo las transacciones de ingreso.
        .map((e) =>
            e.amount) //te ayuda a extraer solo los montos de las transacciones
        .fold(0.0, (a, b) => a + b); //es eficiente para sumar todos los valores
  } //se puede usar reduce() pero cuando la lista esta vacia tira problemas

  double getDoubleExpense() {
    return _transactions
        .where((element) => element.type == TransactionType.expense)
        .map((t) => t.amount)
        .fold(0.0, (a, b) => a + b);
  }

  double getBalance() {
    return getDoubleIncome() + getDoubleExpense();
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
