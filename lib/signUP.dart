import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:parking/logIN.dart';
import 'package:parking/models/signup_api_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true;

  TextEditingController emailController = TextEditingController();
  bool showEmailError = false;

  TextEditingController plateController = TextEditingController();
  bool showPlateError = false;

  TextEditingController passwordController = TextEditingController();
  bool showPasswordError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/signup.png'),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40,
                          color: Color.fromRGBO(88, 80, 141, 1),
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        height: 30,
                        width: 80,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Container(
                        width: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.7,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.7,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Color.fromRGBO(88, 80, 141, 1),
                                ),
                                hintText: "Email",
                                labelText: 'Email',
                                errorText: showEmailError
                                    ? 'Please enter email'
                                    : null,
                                labelStyle: TextStyle(
                                    fontSize: 18.0, color: Colors.grey),
                              ),
                              onChanged: (text) {
                                setState(() {
                                  showEmailError = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                            ),
                            TextFormField(
                              controller: plateController,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.7,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.7,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.car_rental,
                                  color: Color.fromRGBO(88, 80, 141, 1),
                                ),
                                hintText: "Plate Number",
                                labelText: 'Number Plate',
                                errorText: showPlateError
                                    ? 'Please enter plate number'
                                    : null,
                                labelStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.grey),
                              ),
                              onChanged: (text) {
                                setState(() {
                                  showPlateError = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: passToggle ? true : false,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.visiblePassword,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.7,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 0.7,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: Color.fromRGBO(88, 80, 141, 1),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      passToggle = !passToggle;
                                    });
                                  },
                                  child: passToggle
                                      ? const Icon(
                                          CupertinoIcons.eye_slash_fill,
                                          color: Colors.grey)
                                      : const Icon(CupertinoIcons.eye_fill,
                                          color: Colors.grey),
                                ),
                                hintText: 'Password',
                                labelText: 'Password',
                                errorText: showPasswordError
                                    ? 'Please enter Password'
                                    : null,
                                labelStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.grey),
                              ),
                              onChanged: (text) {
                                setState(() {
                                  showPasswordError = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            showEmailError = emailController.text.isEmpty;
                            showPlateError = plateController.text.isEmpty;
                            showPasswordError = passwordController.text.isEmpty;
                          });

                          if (!showEmailError &&
                              !showPlateError &&
                              !showPasswordError) {
                            SignUpApiModel.signUp(
                              emailController.text,
                              plateController.text,
                              passwordController.text,
                              context,
                            );
                          }
                        },
                        child: Text(
                          ' SIGN UP ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                            color: Color.fromRGBO(88, 80, 141, 1),
                            width: 1.0,
                          ),
                        ),
                        color: Color.fromRGBO(88, 80, 141, 1),
                        textColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 40.0,
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NameScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Already have an account? Log in',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
