import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:parking/paymentScreen.dart';
import 'package:screenshot/screenshot.dart';

import 'paymob_manager/paymobManager.dart';

class MyCartBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScreenshotController screenshotController = ScreenshotController();

  final List<Map<String, dynamic>>? products;
  final String? discount;

  MyCartBody({
    Key? key,
    this.products,
    this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double calculatedTotalPrice = calculateTotalPrice();

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'My Cart',
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
              Icons.screenshot,
              color: Color.fromRGBO(96, 87, 156, 1),
            ),
            onPressed: () {
              _takeScreenshot();
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Screenshot(
        controller: screenshotController,
        child: RepaintBoundary(
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 90),
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      Expanded(child: Image.asset('images/new/cartgirl.png')),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Text(
                            'Product',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Quantity',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Total Price',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(
                        thickness: 1,
                        height: 12,
                        color: Color(0xffC7C7C7),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: products!.length,
                          itemBuilder: (BuildContext context, int index) {
                            String productName = products![index]['name'];
                            double productPrice = products![index]['price'];
                            int productCount = products![index]['count'];

                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        productName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Expanded(
                                      child: Text(
                                        'x$productCount',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '${(productPrice * productCount).toStringAsFixed(2)} EGP',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 14),
                                const Divider(
                                  thickness: 1,
                                  height: 12,
                                  color: Color(0xffC7C7C7),
                                ),
                                const SizedBox(height: 14),
                              ],
                            );
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Total',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${calculatedTotalPrice.toStringAsFixed(2)} EGP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () async => _pay(context, calculatedTotalPrice),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 30.0, bottom: 1.0),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: Color.fromRGBO(88, 80, 141, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Complete Payment',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var product in products!) {
      totalPrice += product['price'] * product['count'];
    }
    return totalPrice;
  }

  Future<void> _pay(BuildContext context, double totalPrice) async {
    if (products != null && products!.isNotEmpty) {
      _showLoadingDialog(context); // Show loading dialog

      PaymobManager()
          .getPaymentKey(totalPrice.round(), "EGP")
          .then((String paymentKey) {
        Navigator.pop(context); // Hide loading dialog
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentWebView(
              paymentUrl:
                  "https://accept.paymob.com/api/acceptance/iframes/840752?payment_token=$paymentKey",
              price: totalPrice, // Pass totalPrice to PaymentWebView
            ),
          ),
        );
      }).catchError((error) {
        Navigator.pop(context); // Hide loading dialog
        // Handle error here, maybe show a dialog with an error message
        print('Error: $error');
      });
    }
  }

  void _takeScreenshot() {
    screenshotController.capture().then((Uint8List? image) async {
      if (image != null) {
        final result = await ImageGallerySaver.saveImage(image);
        if (result != null) {
          print('Image saved: $result');
        } else {
          print('Failed to save image');
        }
      } else {
        print('Failed to capture screenshot');
      }
    }).catchError((onError) {
      print('Error: $onError');
    });
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Loading..."),
              ],
            ),
          ),
        );
      },
    );
  }
}
