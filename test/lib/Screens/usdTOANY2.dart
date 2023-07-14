import 'package:flutter/material.dart';
import 'package:test/services/services.dart';

class USD extends StatefulWidget {
  final rates;
  final Currencyy;
  const USD({Key? key, required this.rates, required this.Currencyy})
      : super(key: key);

  @override
  State<USD> createState() => _USDState();
}

class _USDState extends State<USD> {
  final ConverterController = TextEditingController();
  String dropdownvalue = 'PKR';
  String answer = 'converted Currency';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2.0,
                    blurRadius: 5.0,
                    offset: const Offset(0, 3), // changes the position of the shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 61, 61, 61),
              ),
              child: Center(
                child: Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: const Color.fromARGB(255, 37, 37, 37),
                    value: dropdownvalue,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    items: widget.Currencyy.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 5.0,
                      offset:
                          const Offset(0, 3), // changes the position of the shadow
                    ),
                  ],
                  color: const Color.fromARGB(255, 51, 51, 51),
                  borderRadius: BorderRadius.circular(20)),
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "USD",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 32, 102),
                            fontWeight: FontWeight.w400,
                            fontSize: 30),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '|',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        dropdownvalue,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 241, 194, 5),
                            fontWeight: FontWeight.w400,
                            fontSize: 30),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      key: const Key('usd'),
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      controller: ConverterController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Enter Ammount',
                          hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          //fillColor: Colors.grey.shade200,
                          filled: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter text';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Text(
                      answer,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 241, 194, 5),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2.0,
                    blurRadius: 5.0,
                    offset: const Offset(0, 3), // changes the position of the shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    answer = '${ConverterController.text} USD      =       ${convertusd(widget.rates, ConverterController.text,
                            dropdownvalue)}   $dropdownvalue';
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 255, 32, 102))),
                child: const Text(
                  'Convert',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
