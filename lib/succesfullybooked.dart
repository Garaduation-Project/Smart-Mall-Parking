import 'package:flutter/material.dart';
import 'package:parking/bookings.dart';
import 'package:parking/homePage.dart';

class SuccessPage extends StatelessWidget {
  final String reservationCode;
  final TextEditingController codeController;

  SuccessPage({required this.reservationCode})
      : codeController = TextEditingController(text: reservationCode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: Color.fromRGBO(88, 80, 141, 1),
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ],
        title: Text(
          'Successfully Booked',
          style: TextStyle(
              fontSize: 24,
              color: Color.fromRGBO(88, 80, 141, 1),
              fontFamily: 'Pacifico'),
        ),
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0, bottom: 10, left: 10),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          'images/code.png',
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Center(
                      child: Text(
                        'Parking Code',
                        style: TextStyle(
                            fontSize: 32,
                            color: Color.fromRGBO(88, 80, 141, 1),
                            fontFamily: 'CantoraOne'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 40),
                    child: Text(
                      'Use This code To Enter And Exit The Parking.',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(171, 167, 174, 1),
                          fontFamily: 'Inter'),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, bottom: 10, left: 2),
                  child: Container(
                    width: 300,
                    height: 80,
                    color: Color.fromRGBO(172, 162, 176, 0.3),
                    child: Center(
                      child: TextField(
                        controller: codeController,
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(88, 80, 141, 1),
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                        ),
                        readOnly:
                            true, // Make it read-only since it's a code from backend
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 40),
                    child: Text(
                      'Note: This code is available for 1 Hour',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(180, 5, 5, 1),
                          fontFamily: 'Inter'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 40),
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Go To Your Bookings',
                        style: TextStyle(
                            color: Color.fromRGBO(238, 238, 238, 1),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cantoraone'),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color: Color.fromRGBO(88, 80, 141, 1), width: 1.0),
                      ),
                      color: Color.fromRGBO(88, 80, 141, 1),
                      textColor: Colors.black,
                      padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                      minWidth: 300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
