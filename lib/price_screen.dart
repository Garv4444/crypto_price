import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'crypto_card.dart';

Map<String, String> cryptoPrices = {};
bool isWaiting = true;

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = 'USD';

  void updateRates() async {
    isWaiting = true;
    var data = await CoinData(currency: currency).getData();
    isWaiting = false;
    setState(() {
      cryptoPrices = data;
    });
  }

  @override
  void initState() {
    super.initState();
    updateRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Coin Ticker'),
        centerTitle: true,
        backgroundColor: Colors.black26,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CryptoCard(
                  currency: currency,
                  cryptoCurrency: 'BTC',
                  cryptoRate: isWaiting ? '?' : cryptoPrices['BTC']!,
                ),
                const SizedBox(
                  height: 15,
                ),
                CryptoCard(
                  currency: currency,
                  cryptoCurrency: 'ETH',
                  cryptoRate: isWaiting ? '?' : cryptoPrices['ETH']!,
                ),
                const SizedBox(
                  height: 15,
                ),
                CryptoCard(
                  currency: currency,
                  cryptoCurrency: 'LTC',
                  cryptoRate: isWaiting ? '?' : cryptoPrices['LTC']!,
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.black38,
            child: DropdownButton(
              value: currency,
              onChanged: (String? value) {
                setState(() {
                  currency = value!;
                  updateRates();
                });
              },
              items: currenciesList.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
