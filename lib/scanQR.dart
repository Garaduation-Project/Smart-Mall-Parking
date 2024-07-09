import 'package:flutter/material.dart';
import 'package:parking/mycartScreen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'QR Scanner',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color.fromRGBO(88, 80, 141, 1),
              fontFamily: 'Pacifico',
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.qr_code,
              color: Color.fromRGBO(96, 87, 156, 1),
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: _qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });
    _controller!.scannedDataStream.listen((scanData) {
      // ignore: unnecessary_null_comparison
      if (scanData != null) {
        _controller!.pauseCamera();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyCartBody(
                    products: _parseScanData(scanData.code),
                  )),
        );
      }
    });
  }

  List<Map<String, dynamic>> _parseScanData(String? data) {
    if (data == null) return [];

    List<Map<String, dynamic>> products = [];
    List<String> lines = data.split('\n');

    for (int i = 0; i < lines.length; i += 2) {
      if (i + 1 < lines.length) {
        String name = lines[i].replaceFirst('product: ', '').trim();
        double price =
            double.tryParse(lines[i + 1].replaceFirst('Price: ', '').trim()) ??
                0.0;

        int index = products.indexWhere((product) => product['name'] == name);
        if (index != -1) {
          products[index]['count'] += 1;
        } else {
          products.add({'name': name, 'price': price, 'count': 1});
        }
      }
    }

    return products;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
