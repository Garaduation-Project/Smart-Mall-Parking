import 'package:flutter/material.dart';
import 'package:parking/homePage.dart';
import 'package:parking/models/login_api_model.dart';
import 'package:parking/pass_reset/email_entre.dart';
import 'package:parking/signUP.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  bool passToggle = true;

  TextEditingController emailController = TextEditingController();
  bool showEmailError = false;

  TextEditingController passwordController = TextEditingController();
  bool showPasswordError = false;

  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        showEmailError = email.isEmpty;
        showPasswordError = password.isEmpty;
      });
      return;
    }

    String? success = await LoginApiModel.login(email, password);

    if (success != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(userEmail: email)),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/login.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40,
                          color: Color.fromRGBO(88, 80, 141, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        height: 30,
                        width: 80,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: 300,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  prefixIcon: Icon(Icons.account_circle,
                                      color: Color.fromRGBO(88, 80, 141, 1)),
                                  hintText: "Email",
                                  labelText: 'Email',
                                  errorText: showEmailError
                                      ? 'Please enter email'
                                      : null,
                                  labelStyle: TextStyle(
                                      fontSize: 18.0, color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    showEmailError = false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 300,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                obscureText: passToggle,
                                controller: passwordController,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.7),
                                  ),
                                  prefixIcon: Icon(Icons.key,
                                      color: Color.fromRGBO(88, 80, 141, 1)),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        passToggle = !passToggle;
                                      });
                                    },
                                    child: Icon(
                                      passToggle
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      fontSize: 16.0, color: Colors.grey),
                                  errorText: showPasswordError
                                      ? 'Please enter Password'
                                      : null,
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    showPasswordError = false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: MaterialButton(
                        onPressed: login,
                        child: Text(
                          ' LOG IN ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Cantoraone',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                              color: Color.fromRGBO(88, 80, 141, 1),
                              width: 1.0),
                        ),
                        color: Color.fromRGBO(88, 80, 141, 1),
                        textColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 40.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EntreEmailPage()),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        "Don't have an account? Sign UP",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
