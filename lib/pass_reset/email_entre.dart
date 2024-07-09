import 'package:flutter/material.dart';
import 'package:parking/models/pass_reset_api_model.dart';
import 'package:parking/pass_reset/pass_reset.dart';

class EntreEmailPage extends StatefulWidget {
  @override
  _EntreEmailPageState createState() => _EntreEmailPageState();
}

class _EntreEmailPageState extends State<EntreEmailPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  String? _message;

  void _sendPasswordResetRequest() async {
    setState(() {
      _isLoading = true;
      _message = null;
    });

    final email = _emailController.text;
    final response = await PasswordResetAPI.requestPasswordReset(email);

    setState(() {
      _isLoading = false;
      _message = response['message'];
    });

    if (response['success']) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPasswordPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Color.fromRGBO(88, 80, 141, 1)),
            onPressed: () {
              // Implement more options if needed
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 27.0),
            child: Icon(
              Icons.alternate_email,
              size: 130,
              color: Color.fromRGBO(88, 80, 141, 1),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                labelText: 'Email',
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Please enter your email to receive a confirmation code to reset your password',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          _isLoading
              ? CircularProgressIndicator()
              : GestureDetector(
                  onTap: _sendPasswordResetRequest,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 50),
                    child: Container(
                      width: 200,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: Color.fromRGBO(88, 80, 141, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'OK',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
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
          if (_message != null)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                _message!,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
