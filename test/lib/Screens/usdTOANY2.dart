import 'package:flutter/material.dart';
import 'package:test/services/services.dart';

class USD extends StatefulWidget {
  final rates;
  final Currencyy;
  const USD({super.key, required this.rates, required this.Currencyy});

  @override
  State<USD> createState() => _USDState();
}

class _USDState extends State<USD> {
  final ConverterController = TextEditingController();
  String dropdownvalue = 'PKR';
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
            TextFormField(
              key: Key('usd'),
              onChanged: (value) {
                setState(() {});
              },
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              //keyboardType: TextInputType.text,
              controller: ConverterController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
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
            DropdownButton<String>(
              dropdownColor: Colors.amber,
              value: dropdownvalue,
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
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  answer = ConverterController.text +
                      ' USD      =       ' +
                      convertusd(widget.rates, ConverterController.text,
                          dropdownvalue) +
                      '   ' +
                      dropdownvalue;
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
