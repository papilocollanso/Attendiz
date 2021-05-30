import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanQR extends StatefulWidget {
  ScanQR({Key key}) : super(key: key);

  @override
  _ScanQRState createState() => _ScanQRState();
}

String qrData = "No data found!";
var data;
bool hasdata = false;

class _ScanQRState extends State<ScanQR> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // tag: "Scan QR",
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "QR Scanner",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontFamily: 'Lucida',
                fontSize: 17,
                color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Raw Data:  ${(qrData)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.launch_outlined,
                      color: Colors.green,
                    ),
                    onPressed: hasdata
                        ? () async {
                            if (await canLaunch(qrData)) {
                              print(qrData);
                              await launch(qrData);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text('Cannot be launched'),
                                duration: const Duration(seconds: 3),
                              ));
                            }
                          }
                        : null,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: ((MediaQuery.of(context).size.width) / 2) - 45,
                height: 36,
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
                        fontFamily: 'Lucida',
                        fontStyle: FontStyle.italic,
                        color: Colors.green),
                  ),
                  onPressed: () async {
                    var options = ScanOptions(
                      autoEnableFlash: false,
                    );
                    var data = await BarcodeScanner.scan(options: options);
                    setState(() {
                      qrData = data.rawContent.toString();
                      hasdata = true;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
