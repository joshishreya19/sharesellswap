import 'package:flutter/material.dart';
import 'package:share_sell_swap/widgets/auth_ui.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/images/cart6.png',
                    color: Colors.cyan.shade900,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('ShareSellSwap',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan.shade900,
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: AuthUi(),
            ),
          ),
          Text(
            'If you continue, you arte accepting\nTerms and Conditions and Privacy Policy',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 10),
          )
        ],
      ),
    );
  }
}
