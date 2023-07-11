import 'package:flutter/material.dart';
import 'package:test/services/services.dart';

class AnyToAny extends StatefulWidget {
  final rates;
  final Currencyy;
  const AnyToAny({super.key, required this.rates, required this.Currencyy});

  @override
  State<AnyToAny> createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  final AmmountController = TextEditingController();
  String dropdownvalue1 = 'PKR';
  String dropdownvalue2 = 'INR';
  String answer = 'converted CUrrency';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Usd To Any',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        spreadRadius: 2.0,
                        blurRadius: 5.0,
                        offset:
                            Offset(0, 3), // changes the position of the shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 61, 61, 61),
                  ),
                  width: 120,
                  height: 60,
                  child: Center(
                    child: Expanded(
                      child: DropdownButton<String>(
                        dropdownColor: Colors.blueGrey,
                        value: dropdownvalue1,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        // icon: Icon(
                        //   Icons.arrow_downward_outlined,
                        //   color: Colors.blue,
                        // ),
                        // iconSize: 24,
                        // elevation: 16,
                        // isExpanded: true,
                        // underline: Container(
                        //   height: 3,
                        //   color: Colors.blueGrey,
                        // ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue1 = newValue!;
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
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withOpacity(0.5),
                        spreadRadius: 2.0,
                        blurRadius: 5.0,
                        offset:
                            Offset(0, 3), // changes the position of the shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 61, 61, 61),
                  ),
                  width: 120,
                  height: 60,
                  //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Center(
                    child: Expanded(
                      child: DropdownButton<String>(
                        dropdownColor: Colors.amber,
                        value: dropdownvalue2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        // icon: Icon(
                        //   Icons.arrow_downward_outlined,
                        //   color: Colors.blue,
                        // ),
                        // iconSize: 24,
                        // elevation: 16,
                        // isExpanded: true,
                        // underline: Container(
                        //   height: 3,
                        //   color: Colors.blueGrey,
                        // ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue2 = newValue!;
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
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/refresh.png'),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              key: Key('usd'),
              onChanged: (value) {
                setState(() {});
              },
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              controller: AmmountController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Enter Ammount',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  //fillColor: Colors.grey.shade200,
                  filled: true),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter text';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    answer = AmmountController.text +
                        '  ' +
                        dropdownvalue1 +
                        '  ' +
                        convertAny(widget.rates, AmmountController.text,
                            dropdownvalue1, dropdownvalue2) +
                        '   ' +
                        dropdownvalue2;
                  });
                },
                child: Text(
                  'Convert',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 255, 32, 102))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                answer,
                style: TextStyle(color: Colors.amber),
              ),
            )
          ],
        ),
      ),
    );
  }
}
