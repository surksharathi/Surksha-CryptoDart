import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart'as http;
import 'dart:convert';

class HomeCrypto extends StatefulWidget{
  final  List currencies;
  HomeCrypto(this.currencies);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeCryptoState();
  }
}

class HomeCryptoState extends State<HomeCrypto>{


final List<MaterialColor> _color =[Colors.purple,Colors.pink,Colors.blue,Colors.lightGreen,Colors.orange];

 


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto App'),
        brightness: Brightness.dark ,
        elevation: 20.0,
        bottomOpacity: 12.0,


      ),
      body: cryptoWidget(),
    );
  }

Widget cryptoWidget(){

  return  Container(
    child:Column(children: <Widget>[

     Flexible(
      child: ListView.builder(
        itemCount:widget. currencies.length,
        itemBuilder: (BuildContext context, int index){
          final Map currency = widget.currencies[index];
          final MaterialColor color = _color[index % _color.length];

          return getListitemUi(currency,color);



        },
      ),
    ),
    ],)
       
       
       
    
      
  );
}
Widget getListitemUi(Map currency, MaterialColor color){

  return ListTile(
    leading: CircleAvatar(
      radius: 25.0,
      backgroundColor: color,
      child: Text(currency['name'][0]),

    ),


title: Text(currency['name'],
        style:TextStyle(fontWeight: FontWeight.bold),
        
        ),
        subtitle: _getSubstitleText(currency['price_usd'],currency['percent_change_1h']),
        isThreeLine: true
  );
}

Widget _getSubstitleText(String priceUSD, String percentChange){
  

  TextSpan priceTextWidget = TextSpan(
    text: "\$$priceUSD\n",
    style: TextStyle(
      color: Colors.black
    )
  );
  String percentageChangeText =" 1 hour: $percentChange";
  TextSpan percentageChangeTextWidget;
  if(double.parse(percentChange)>0){
    percentageChangeTextWidget = TextSpan(
      text: percentageChangeText,
      style: TextStyle(color: Colors.green)
    );
  }
  else {
    percentageChangeTextWidget = TextSpan(
      text: percentageChangeText,
      style: TextStyle(color: Colors.red)
    );
  }
  return RichText(
    text: TextSpan(
      children: [priceTextWidget,percentageChangeTextWidget]
    )
  );
}


}