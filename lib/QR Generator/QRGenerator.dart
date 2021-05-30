import 'package:flutter/material.dart';

import 'GeneratedQR.dart';

class QRGenerator extends StatefulWidget {
  QRGenerator({Key key}) : super(key: key);

  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

TextEditingController mycontroller = new TextEditingController();

class _QRGeneratorState extends State<QRGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "QR Generator",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontFamily: 'Lucida',
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                cursorColor: Colors.green,
                cursorHeight: 15,
                controller: mycontroller,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Lucida',
                    fontSize: 15),
                decoration: InputDecoration(
                  errorStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 15.0,
                      fontFamily: 'Lucida',
                      fontStyle: FontStyle.italic),
                  labelText: "Enter the data for generating a QR",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Lucida',
                      fontStyle: FontStyle.italic,
                      fontSize: 15),
                  prefixIcon: Icon(Icons.link, color: Colors.green),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onEditingComplete: navigate,
              ),
            ),
            Container(
              width: ((MediaQuery.of(context).size.width) / 2) - 45,
              height: 35,
              child: OutlineButton(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.green,
                ),
                shape: StadiumBorder(),
                child: Text(
                  "Generate QR",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Lucida',
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                onPressed: navigate,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigate() {
    print(mycontroller.text);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GeneratedQR(mycontroller.text)));
  }
}
