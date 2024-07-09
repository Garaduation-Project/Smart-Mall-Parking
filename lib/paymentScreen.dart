import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:parking/failed_paying.dart';
import 'package:parking/thankYouScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String paymentUrl;
  final double price;

  PaymentWebView({required this.paymentUrl, required this.price});

  @override
  _PaymentWebViewState createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late WebViewController _webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Color.fromRGBO(88, 80, 141, 1),
            fontFamily: 'Pacifico',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.payment,
              color: Color.fromRGBO(96, 87, 156, 1),
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.paymentUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
            },
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (url) async {
              log('payment success' + url);
              setState(() {
                isLoading = false;
              });

              if (url.contains('Approved')) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ThankYouView(
                            price: widget.price,
                            paymentSuccessful: true,
                          )),
                );
              } else {
                String pageContent =
                    await _webViewController.runJavascriptReturningResult(
                  "document.body.innerText",
                );

                if (pageContent.contains('Error')) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FailYouView(),
                    ),
                  );
                }
              }
            },
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
