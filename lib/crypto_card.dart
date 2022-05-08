import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  CryptoCard(
      {Key? key,
      required this.currency,
      required this.cryptoCurrency,
      required this.cryptoRate})
      : super(key: key);

  final String currency;
  final String cryptoCurrency;
  final String cryptoRate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black38,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoCurrency = $cryptoRate $currency',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
