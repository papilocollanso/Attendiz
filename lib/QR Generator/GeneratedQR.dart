import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class GeneratedQR extends StatefulWidget {
  final myQR;

  const GeneratedQR(this.myQR);

  @override
  _GeneratedQRState createState() => _GeneratedQRState();
}

class _GeneratedQRState extends State<GeneratedQR> {
  final _screenshotController = ScreenshotController();
  @override
  void initstate() {
    super.initState();
  }

  GlobalKey globalKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Generated QR ",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Lucida'),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Screenshot(
        controller: _screenshotController,
        child: Center(
          child: RepaintBoundary(
            key: globalKey,
            child: QrImage(
              data: widget.myQR,
              version: QrVersions.auto,
              size: 245.0,
              gapless: true,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shareImage,
        child: Icon(Icons.share, color: Colors.white),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _shareImage() async {
    final imageFile = await _screenshotController.capture();
    Share.shareFiles([imageFile.path], text: 'Share with ... ');
  }
}
