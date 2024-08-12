import 'package:flutter/material.dart';
import 'package:parking/logIN.dart';
import 'package:parking/models/pass_reset_api_model.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _message;

  void _resetPassword() async {
    setState(() {
      _isLoading = true;
      _message = null;
    });

    final resetToken = _codeController.text;
    final newPassword = _passwordController.text;
    final response =
        await PasswordResetAPI.resetPassword(resetToken, newPassword);

    setState(() {
      _isLoading = false;
      _message = response['message'];
    });

    if (response['success']) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NameScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
          style: TextStyle(
            fontFamily: 'Pacifico',
            color: Color.fromRGBO(88, 80, 141, 1),
            fontSize: 26,
          ),
        ),
        backgroundColor: Color.fromRGBO(172, 162, 176, 0.3),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Color.fromRGBO(88, 80, 141, 1)),
            onPressed: () {
              // Implement more options
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/pass_reset.png', // Replace with your actual image path
                width: 180, // Optional: Set the image width
                height: 180, // Optional: Set the image height
                fit: BoxFit
                    .contain, // Optional: Adjust how the image is displayed
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: '  Confirmation code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: '  New password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : GestureDetector(
                    onTap: _resetPassword,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 40, 30, 50),
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
                            'Reset',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'Cantoraone',
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
      ),
    );
  }
}
