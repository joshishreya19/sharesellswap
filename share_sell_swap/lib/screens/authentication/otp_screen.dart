import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  // const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
       appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
      ),
       body: Center(child: Text('OTP Screen'),),
    );
  }
}
