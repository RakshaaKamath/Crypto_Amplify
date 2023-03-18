import 'package:crypto/Model/coinModel.dart';
import 'package:crypto/View/Components/item2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getCoinMarket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: myHeight,
        width: myWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color(0xffffffff),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              height: myHeight * 0.9,
              width: myWidth,

              child: Column(
                children: [
                  SizedBox(
                    height: myHeight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: myWidth * 0.08),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            'CRYPTO  COINS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 2,
                            ),
                          ),
                        )


                      ],
                    ),
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: myWidth * 0.003),
                      child: isRefreshing == true
                          ? Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff000000),
                        ),
                      )
                          : coinMarket == null || coinMarket!.length == 0
                          ? Padding(
                        padding: EdgeInsets.all(myHeight * 0.06),
                        child: Center(
                          child: Text(
                            'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                          : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: coinMarket!.length,
                        itemBuilder: (context, index) {
                          return Item2(
                            item: coinMarket![index],
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: myHeight * 0.01,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isRefreshing = true;

  List? coinMarket = [];
  var coinMarketList;
  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

    setState(() {
      isRefreshing = true;
    });
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    setState(() {
      isRefreshing = false;
    });
    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      print(response.statusCode);
    }
  }
}