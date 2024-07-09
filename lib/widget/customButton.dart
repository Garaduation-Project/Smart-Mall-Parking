import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.image,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 50, // Adjust the size as needed
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
