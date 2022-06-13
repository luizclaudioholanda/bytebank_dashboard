import 'dart:convert';

import 'package:bytebank_dashborad/http/webclient.dart';
import 'package:bytebank_dashborad/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {

  Future<List<Transaction>> findAll() async {
    final Response response = await client
        .get(Uri.http(baseUrl, 'transactions'))
        .timeout(Duration(seconds: 30));

    final List<dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson
        .map((dynamic json) => Transaction.fromJson((json)))
        .toList();

  }

  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionMap = _toMap(transaction);

    final String transactionJson = jsonEncode(transactionMap);

    final Response response = await client.post(Uri.http(baseUrl, 'transactions'),
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }

  Map<String, dynamic> _toMap(Transaction transaction) {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.fullName,
        'accountNumber': transaction.contact.accountNumber
      }
    };
    return transactionMap;
  }

}