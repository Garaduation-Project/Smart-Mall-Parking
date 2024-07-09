import 'package:flutter/material.dart';

class VisaPaymentPage extends StatefulWidget {
  @override
  _VisaPaymentPageState createState() => _VisaPaymentPageState();
}

class _VisaPaymentPageState extends State<VisaPaymentPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Payment'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.payment_outlined),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.1),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 344,
              height: 250,
              child: AspectRatio(
                aspectRatio: 487 / 451,
                child: Container(
                  // boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10);],
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: AssetImage('images/new/images.jpg'),
                    ),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: cardNumberController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.grey, width: 0.7),
                ),
                labelText: 'Card Number',
                labelStyle:
                    TextStyle(fontSize: 16.0, color: Colors.grey.shade900),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: expiryDateController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey, width: 0.7),
                      ),
                      labelText: 'Expiry Date',
                      labelStyle: TextStyle(
                          fontSize: 16.0, color: Colors.grey.shade900),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: cvvController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey, width: 0.7),
                      ),
                      labelText: 'CVV',
                      labelStyle: TextStyle(
                          fontSize: 16.0, color: Colors.grey.shade900),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Implement payment processing logic here
                // You would typically integrate with a payment gateway
                // and handle the response accordingly.
                // For simplicity, let's just print the entered details.
                print('Card Number: ${cardNumberController.text}');
                print('Expiry Date: ${expiryDateController.text}');
                print('CVV: ${cvvController.text}');
              },
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
