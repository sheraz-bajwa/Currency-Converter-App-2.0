import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/services/meethood.dart';

class StateServices {
  // Future<List<String>> fetchGenres5() async {
  //   var url = Uri.parse(
  //       'https://openexchangerates.org/api/latest.json?app_id=5fa5c23540af4f248e6086de0a2a273a');

  //   try {
  //     var response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);
  //       List<String> genres = jsonResponse['rates'];
  //       return genres;
  //     } else {
  //       throw Exception('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error: $e');
  //   }
  // }

  Future<Currency> fetchExchangeRates() async {
    var url = Uri.parse(
        'https://openexchangerates.org/api/latest.json?app_id=5fa5c23540af4f248e6086de0a2a273a');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        //print(response.body);
        var data = jsonDecode(response.body);
        final result = Currency.fromJson(data);
        return result;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map> fetchCurrencies() async {
    var url = Uri.parse(
        'https://openexchangerates.org/api/currencies.json?app_id=5fa5c23540af4f248e6086de0a2a273a');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var currenciesMap = json.decode(response.body);
      return currenciesMap;
    } else {
      throw Exception('Failed to fetch currencies');
    }
  }
}
// Dollar to any converter methood
String convertusd(Map exchangeRates, String usd, String currency) {
  String Output =
      ((exchangeRates[currency] * double.parse(usd)).toStringAsFixed(2))
          .toString();
  return Output;
}
//Any to Any converter methood
String convertAny(Map exchangeRates, String ammount, String currencyBase,
    String currencyFinal) {
  String Output = ((double.parse(ammount) * exchangeRates[currencyBase]) /
          exchangeRates[currencyFinal])
      .toStringAsFixed(2)
      .toString();
  return Output;
}
