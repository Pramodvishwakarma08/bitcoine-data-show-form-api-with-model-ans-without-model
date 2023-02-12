import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class BitCoinPage2 extends StatefulWidget {
  const BitCoinPage2({Key? key}) : super(key: key);

  @override
  State<BitCoinPage2> createState() => _BitCoinPage2State();
}

class _BitCoinPage2State extends State<BitCoinPage2> {
  Map? data ;
  Future fechData()async{
    String url ="https://api.coindesk.com/v1/bpi/currentprice.json";
    http.Response response= await http.get(Uri.parse(url));
    Map<String , dynamic> jsonresponse = jsonDecode(response.body);
    setState(() {
      data= jsonresponse["time"];

    });
  }


  @override
  void initState() {
    fechData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("$data"),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
//without model data checking prosses