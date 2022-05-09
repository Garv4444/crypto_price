import 'package:http/http.dart';
import 'dart:convert';

const String apiKey = 'API KEY';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  final String currency;
  CoinData({required this.currency});
  Future getData() async {
    Map<String, String> cryptoPrices = {};
    for (String cryptoCurrency in cryptoList) {
      Uri url = Uri.parse(
          'http://rest.coinapi.io/v1/exchangerate/$cryptoCurrency/$currency?apikey=$apiKey');
      Response response = await get(url);
      print(response.statusCode);
      var convertedData = jsonDecode(response.body);
      print(convertedData['rate']);
      cryptoPrices[cryptoCurrency] = convertedData['rate'].toStringAsFixed(2);
    }
    return cryptoPrices;
  }
}
