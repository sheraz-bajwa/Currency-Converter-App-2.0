import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:test/Screens/AnyToAll.dart';
import 'package:test/Screens/usdTOANY2.dart';
import 'package:test/services/meethood.dart';
import 'package:test/services/services.dart';

class home1 extends StatefulWidget {
  const home1({
    super.key,
  });

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  String dropdownvalue = 'PKR';
  String result = 'convertedCUrrency';
  @override
  Widget build(BuildContext context) {
    StateServices stateservices = StateServices();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Currency Exchange',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                              // AnyToAny(
                              //   Currencyy: Currsnapshot.data,
                              //   rates: snapshot.data!.rates,
                              // )
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
      ),
    );
  }
}
