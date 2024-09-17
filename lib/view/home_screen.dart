import 'package:flutter/material.dart';
import 'components/add_transaction_dialog.dart';
import 'components/home_header.dart';
import 'components/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: const SafeArea(
        bottom: false,
        child: Column(
          children: [
            HomeHeaderColumn(),
            TransactionList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddTransactionDialog();
              },
              isScrollControlled: true);
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
