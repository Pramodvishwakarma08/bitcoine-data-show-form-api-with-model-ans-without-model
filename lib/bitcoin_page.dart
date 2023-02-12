import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/bitcoin_page2.dart';
import 'package:untitled2/models/bitcoine_model.dart';

class BitCoinPage extends StatefulWidget {
  const BitCoinPage({Key? key}) : super(key: key);

  @override
  State<BitCoinPage> createState() => _BitCoinPageState();
}

class _BitCoinPageState extends State<BitCoinPage> {
  Map? data;
  Future<BitCoinModel> fechData() async {
    BitCoinModel bm;
    String url = "https://api.coindesk.com/v1/bpi/currentprice.json";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    bm = BitCoinModel.fromJson(jsonresponse);
    return bm;
    // setState(() {
    //   data= jsonresponse["time"];
    //
    // });
  }

  @override
  void initState() {
    fechData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("with model"),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: fechData(),
            builder: (context, AsyncSnapshot<BitCoinModel> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 56,
                    ),
                    Container(
                      width: double.infinity,
                      child: Card(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("${snapshot.data!.time.updated}"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: Card(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("${snapshot.data!.disclaimer}"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          child: Card(
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("EURO"),
                            ),
                          ),
                        ),
                        Container(
                          // width: double.infinity,
                          width: 150,
                          child: Card(
                            color: Colors.pink,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("${snapshot.data!.bpi.eur.rate}"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          child: Card(
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("USD"),
                            ),
                          ),
                        ),
                        Container(
                          // width: double.infinity,
                          width: 150,
                          child: Card(
                            color: Colors.deepOrange,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("${snapshot.data!.bpi.usd.rate}"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          child: Card(
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("GBP"),
                            ),
                          ),
                        ),
                        Container(
                          // width: double.infinity,
                          width: 150,
                          child: Card(
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("${snapshot.data!.bpi.gbp.rate}"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BitCoinPage2(),
                              ));
                        },
                        child: Text("without model")),
                  ],
                );
              }
            }),
      ),
    );
  }
}
