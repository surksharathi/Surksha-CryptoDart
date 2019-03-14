import 'package:flutter/material.dart';
import './home_crypto/home_crypto.dart';
import 'package:http/http.dart'as http;
import'dart:convert';
import 'package:async/async.dart';

void main() async  {

  List currencies = await getCurrencies();

  print(currencies);
  
   runApp(MyApp(currencies));

}

class MyApp extends StatefulWidget{
  final List currency;
  MyApp(this.currency);

  
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState(currency);
  }
 
  }
  class _MyAppState extends State<MyApp>{

     final List _currencies;

  _MyAppState(this._currencies);


@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.teal,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.yellow
        )
      ),
      home: HomeCrypto(_currencies),
    );

  }
  }

  Future<List> getCurrencies () async{
  String cryptoURL = "https://api.coinmarketcap.com/v1/ticker/?convert=limit=50";
  http.Response response =await http.get(cryptoURL);
  return json.decode(response.body);


}
