import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/controller/transaction_provider.dart';
import 'package:myapp/model/transaction.dart';
import 'package:provider/provider.dart';

class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({super.key});

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  int? typeIndex = 0; //entero que no puede ser nulo
  TransactionType type = TransactionType.income;
  double amount = 0;
  String description = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 515,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 50,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(3)),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "New transaction",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
          ),
          CupertinoSlidingSegmentedControl(
              children: const {
                0: Text("Income"),
                1: Text("Expense"),
              },
              groupValue: typeIndex, //este define que queda clickeado
              onValueChanged: (value) {
                //se activa cuando el usuario selecciona uno de los segmentos
                setState(() {
                  typeIndex = value;
                  type = value == 0
                      ? TransactionType.income
                      : TransactionType.expense;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "AMOUNT",
            style: TextStyle(color: Colors.teal),
          ),
          TextField(
            inputFormatters: [
              CurrencyTextInputFormatter.currency(symbol: "\$")
            ],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration.collapsed(
              hintText: "\$0.00",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            autofocus: true,
            onChanged: (value) {
              final valuewithOutDolarsign = value.replaceAll("\$", "");
              final valueWithOutCommas =
                  valuewithOutDolarsign.replaceAll(",", "");
              if (valueWithOutCommas.isNotEmpty) {
                amount = double.parse(valueWithOutCommas);
              }
            },
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration.collapsed(
                hintText: "Enter a description",
                hintStyle: TextStyle(color: Colors.grey)),
            onChanged: (value) {
              description = value;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 4, backgroundColor: Colors.teal),
              onPressed: () {
                final transaction = Transaction(
                  type: type,
                  amount: type == TransactionType.expense ? -amount : amount,
                  description: description,
                );

                Provider.of<TransactionsProvider>(context, listen: false)
                    .addTransaction(transaction);

                Navigator.pop(context);
              },
              child: const Text(
                "Add",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
