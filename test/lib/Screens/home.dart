import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:test/Screens/AnyToAll.dart';
import 'package:test/Screens/usdTOANY2.dart';
import 'package:test/services/meethood.dart';
import 'package:test/services/services.dart';

class home extends StatefulWidget {
  const home({
    super.key,
  });

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String dropdownvalue = 'PKR';
  String result = 'convertedCUrrency';
  @override
  Widget build(BuildContext context) {
    StateServices stateservices = StateServices();

    return Scaffold(
      appBar: AppBar(
        title: Text('Hellooooooooooooooooooo'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
                child: FutureBuilder(
              future: stateservices.fetchExchangeRates(),
              builder: (context, AsyncSnapshot<Currency> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                return Center(
                  child: FutureBuilder(
                    future: stateservices.fetchCurrencies(),
                    builder: (context, AsyncSnapshot<Map> Currsnapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Handle the error condition
                        return Text('Error fetching ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            USD(
                              Currencyy: Currsnapshot.data,
                              rates: snapshot.data!.rates,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AnyToAny(
                              Currencyy: Currsnapshot.data,
                              rates: snapshot.data!.rates,
                            )
                            //Text(snapshot.data!.rates.toString())
                          ],
                        );
                      } else {
                        return Text('No data available');
                      }
                    },
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
