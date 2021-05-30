import 'package:flutter/material.dart';

import 'QR Generator/QRGenerator.dart';
import 'QR Scanner/ScanQR.dart';

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bool shouldPop = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Attendiz",
            style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                fontFamily: 'Lucida',
                color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Container(
            height: (MediaQuery.of(context).size.height),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: (MediaQuery.of(context).size.height) -
                        AppBar().preferredSize.height -
                        kToolbarHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/splash6.jpg",
                      ),
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      radius: 120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Hero(
                          tag: "Scan QR",
                          child: Container(
                            width:
                                ((MediaQuery.of(context).size.width) / 2) - 45,
                            height: 50,
                            child: OutlineButton(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                              shape: StadiumBorder(),
                              child: Text(
                                "Scan QR",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Lucida'),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ScanQR()));
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: ((MediaQuery.of(context).size.width) / 2) - 45,
                          height: 50,
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
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Lucida'),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRGenerator()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
