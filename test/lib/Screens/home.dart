import 'package:flutter/material.dart';
import 'package:test/Screens/AnyToAll.dart';
import 'package:test/services/meethood.dart';
import 'package:test/services/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class home extends StatefulWidget {
  const home({
    super.key,
  });

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 8), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    // TODO: implement setState
    _controller.dispose();
  }

  final formKey = GlobalKey<FormState>();
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
                  child: Form(
                key: formKey,
                child: FutureBuilder(
                  future: stateservices.fetchExchangeRates(),
                  builder: (context, AsyncSnapshot<Currency> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SpinKitFadingCircle(
                          color: Colors.amberAccent,
                          size: 50,
                          controller: _controller,
                        ),
                      );
                    }
                    return Center(
                      child: FutureBuilder(
                        future: stateservices.fetchCurrencies(),
                        builder: (context, AsyncSnapshot<Map> Currsnapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: SpinKitFadingCircle(
                                color: Colors.amberAccent,
                                size: 50,
                                controller: _controller,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            // Handle the error condition
                            return Text('Error fetching ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // USD(
                                //   Currencyy: Currsnapshot.data,
                                //   rates: snapshot.data!.rates,
                                // ),
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
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
