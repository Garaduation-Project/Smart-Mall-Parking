import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:parking/bookings.dart';
import 'package:parking/logIN.dart';
import 'package:parking/map/google_map_page.dart';
import 'package:parking/models/logout_api_model.dart';
import 'package:parking/parkingScreen.dart';
import 'package:parking/scanQR.dart';

class HomePage extends StatefulWidget {
  final String? userEmail;

  HomePage({Key? key, this.userEmail}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = "";
  bool isPresent = false;

  @override
  void initState() {
    super.initState();
    email = widget.userEmail ?? "";
  }

  Future<void> fetchUserDetails() async {
    final userDetails = await LogOutApiModel.getUserDetails();
    if (userDetails != null) {
      setState(() {
        email = userDetails['email'];
      });
    } else {
      print('Failed to load user details');
    }
  }

  Future<void> logOut() async {
    final result = await LogOutApiModel.logOut();
    if (result) {
      setState(() {
        email = "";
        isPresent = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => NameScreen()),
      );
    } else {
      print('Failed to log out');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'HOME',
          style: TextStyle(
            fontSize: 26,
            color: Color.fromRGBO(88, 80, 141, 1),
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.directions_car_filled,
              color: Color.fromRGBO(88, 80, 141, 1),
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(88, 80, 141, 0.3),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/login.png'),
              ),
              accountName: Text(
                'Hello! ' + email,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: null,
            ),
            ListTile(
              leading: Icon(
                Icons.edit,
                color: Color.fromRGBO(88, 80, 141, 1),
              ),
              title: Text(
                'Bookings',
                style: TextStyle(
                    color: Color.fromRGBO(88, 80, 141, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.map,
                color: Color.fromRGBO(88, 80, 141, 1),
              ),
              title: Text(
                'Get Directions',
                style: TextStyle(
                  color: Color.fromRGBO(88, 80, 141, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Color.fromRGBO(88, 80, 141, 1),
              ),
              onTap: logOut,
              title: Text(
                'Log Out',
                style: TextStyle(
                  color: Color.fromRGBO(88, 80, 141, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 25,
              endIndent: 25,
            ),
            SizedBox(
              height: 60,
              child: Center(
                  child: Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Cantoraone',
                  fontSize: 26,
                ),
              )),
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Color.fromRGBO(88, 80, 141, 1),
              ),
              title: Text(
                '+20 1026383650',
                style: TextStyle(
                  color: Color.fromRGBO(88, 80, 141, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Color.fromRGBO(88, 80, 141, 1),
              ),
              title: Text(
                'KhaledCse2024@outlook.com',
                style: TextStyle(
                  color: Color.fromRGBO(88, 80, 141, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on,
                color: Color.fromRGBO(88, 80, 141, 1),
              ),
              title: Text(
                'Omar Ibn Elkhttab st. vell Algamaae, Zagazig, Egypt',
                style: TextStyle(
                  color: Color.fromRGBO(88, 80, 141, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FadeInUp(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add some content to the Expanded widget
                    SizedBox(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SizedBox(
                                  // width: 420,
                                  // height: 300,
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 340,
                                    height: 200,
                                    child: AspectRatio(
                                      aspectRatio: 487 / 451,
                                      child: CircleAvatar(
                                        radius: 170,
                                        backgroundColor:
                                            Color.fromRGBO(88, 80, 141, 1),
                                        child: CircleAvatar(
                                          radius: 97,
                                          backgroundImage:
                                              AssetImage(('images/lot1.png')),
                                          backgroundColor:
                                              Color.fromRGBO(88, 80, 141, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          30.0, 25.0, 40.0, 0.0),
                                      child: FadeInUp(
                                        child: MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReservationPage(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              ' Reserve Parking',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    238, 238, 238, 1),
                                                fontSize: 24.0,
                                                fontFamily: 'Cantoraone',
                                                //fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      88, 80, 141, 1),
                                                  width: 1.0),
                                            ),
                                            color:
                                                Color.fromRGBO(88, 80, 141, 1),
                                            textColor: Colors.black,
                                            padding: EdgeInsets.fromLTRB(
                                                10, 15, 10, 15)
                                            // minWidth: double.infinity,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                  // width: 420,
                                  // height: 300,
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 340,
                                    height: 200,
                                    child: AspectRatio(
                                      aspectRatio: 487 / 451,
                                      child: CircleAvatar(
                                        radius: 170,
                                        backgroundColor:
                                            Color.fromRGBO(88, 80, 141, 1),
                                        child: CircleAvatar(
                                          radius: 97,
                                          backgroundImage: AssetImage(
                                              ('images/new/payment.jpeg')),
                                          backgroundColor:
                                              Color.fromRGBO(88, 80, 141, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40.0, 25.0, 40.0, 20.0),
                                      child: FadeInUp(
                                        child: MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ScanQR(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              ' Pay with Visa',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    238, 238, 238, 1),
                                                fontSize: 24.0,
                                                fontFamily: 'Cantoraone',
                                                //fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      88, 80, 141, 1),
                                                  width: 1.0),
                                            ),
                                            color:
                                                Color.fromRGBO(88, 80, 141, 1),
                                            textColor: Colors.black,
                                            padding: EdgeInsets.fromLTRB(
                                                20, 15, 20, 15)
                                            // minWidth: double.infinity,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
