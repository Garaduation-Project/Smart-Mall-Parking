import 'package:flutter/material.dart';
import 'package:parking/homePage.dart';
import 'package:parking/models/freeslots_api_model.dart';
import 'package:parking/models/reserve_api_model.dart';
import 'package:parking/succesfullybooked.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final FreeSlotApiModel _apiModel = FreeSlotApiModel();
  late Future<int> _freeSlots;

  @override
  void initState() {
    super.initState();
    _freeSlots = _apiModel.fetchFreeSlots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reservation',
          style: TextStyle(
            color: Color.fromRGBO(88, 80, 141, 1),
            fontFamily: 'Pacifico',
            fontSize: 26,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
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
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 350,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'images/reserve_page.png',
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 170,
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 10, left: 40),
                child: Center(
                  child: RichText(
                    maxLines: 2,
                    text: const TextSpan(
                      text: "Kindly ",
                      style: TextStyle(
                        wordSpacing: 4,
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'CantoraOne',
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Press Reserve To",
                          style: TextStyle(
                            wordSpacing: 4,
                            color: Color.fromRGBO(88, 80, 141, 1),
                            fontSize: 28,
                            fontFamily: 'CantoraOne',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " Get Your Code ",
                          style: TextStyle(
                            wordSpacing: 4,
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: 'CantoraOne',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: FutureBuilder<int>(
                  future: _freeSlots,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Cantoraone',
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return Text(
                        'Free Slots : ${snapshot.data}',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Cantoraone',
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      return Text(
                        'Free Slots : 0',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Cantoraone',
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                  }),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                // Call the API model method to reserve a slot
                Map<String, dynamic> result =
                    await ReservationApiModel.reserveSlot();
                if (result['success']) {
                  // Navigate to SuccessPage with the reservation code
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SuccessPage(reservationCode: result['code'])),
                  );
                } else {
                  // Handle reservation failure if needed
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to reserve slot.')),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 70.0, right: 70, top: 20),
                child: Container(
                  width: 70,
                  height: 60,
                  decoration: ShapeDecoration(
                    color: Color.fromRGBO(88, 80, 141, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Reserve',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Cantoraone',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
