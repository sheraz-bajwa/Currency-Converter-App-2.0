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
         
          children: [
            Text(
              'UsdToAny',
              style: TextStyle(fontSize: 30, color: Colors.amber),
            ),
            SizedBox(
              height: 20,
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
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  hintText: 'Enter Ammount',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  //decoration: BoxDecoration(color: Colors.blueAccent),
                  width: 50,
                  child: Expanded(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.blueGrey,
                      value: dropdownvalue1,
                      style: TextStyle(color: Colors.black),
                      icon: Icon(
                        Icons.arrow_downward_outlined,
                        color: Colors.blue,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: Container(
                        height: 3,
                        color: Colors.blueGrey,
                      ),
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
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 80,
                  //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Expanded(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.amber,
                      value: dropdownvalue2,
                      style: TextStyle(color: Colors.black),
                      icon: Icon(
                        Icons.arrow_downward_outlined,
                        color: Colors.blue,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: Container(
                        height: 3,
                        color: Colors.blueGrey,
                      ),
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
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
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
              child: Text('Convert'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.amber)),
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
