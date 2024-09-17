import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final Widget ico1;
  final String text1;
  final double amount;

  const HeaderCard({
    super.key,
    required this.ico1,
    required this.text1,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final formatedAmount = amount < 0
        ? "-\$${amount.abs().toStringAsFixed(2)}"
        : "\$${amount.toStringAsFixed(2)}";

    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ico1,
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    text1,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(
                    width: 12,
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                formatedAmount,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
