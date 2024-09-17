import 'package:flutter/material.dart';
import 'package:myapp/controller/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'header_card.dart';

class HomeHeaderColumn extends StatelessWidget {
  const HomeHeaderColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionsProvider>(context);
    final balance = provider.getBalance();
    final income = provider.getDoubleIncome();
    final expense = provider.getDoubleExpense();

    return SizedBox(
      height: 280,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Money Tracker",
            style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 3, 35, 32),
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            height: 15,
          ), //espacio
          const Text(
            "Balance",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            '\$${balance.toStringAsFixed(2)}',
            style: const TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                HeaderCard(
                  text1: 'Income',
                  amount: income,
                  ico1: const Icon(Icons.attach_money, color: Colors.green),
                ),
                const SizedBox(width: 12),
                 HeaderCard(
                  text1: 'Expensas',
                  amount: expense,
                  ico1: const Icon(Icons.money_off, color: Colors.red),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
