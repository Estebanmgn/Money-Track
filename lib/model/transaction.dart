class Transaction {
  final TransactionType type;
  final double amount;
  final String description;

  Transaction({required this.type,required this.amount,required this.description});
}

//cuando me refiera a cualquiera de estos valores, me refiero a un TransacctionType
enum TransactionType { income, expense }
