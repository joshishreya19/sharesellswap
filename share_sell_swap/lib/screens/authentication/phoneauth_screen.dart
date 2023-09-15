import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_sell_swap/services/phoneauth_service.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const String id = 'phone-auth-screen';
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  bool validate = false;

  var countryCodeController = TextEditingController(text: '+91');
  var phoneNumberController = TextEditingController();

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
          SizedBox(
            width: 8,
          ),
          Text('Please Wait'),
        ],
      ),
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  PhoneAuthServices _service =PhoneAuthServices();
  // phoneAuthentication(number) {
  //   print(number);
  // }

  String counterText = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue.shade200,
              child: Icon(
                CupertinoIcons.person_alt_circle,
                color: Colors.blue,
                size: 60,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Enter your Phone Number',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'We will send conformation code to your phone',
              style: TextStyle(color: Colors.grey),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: countryCodeController,
                    enabled: false,
                    decoration: InputDecoration(
                        counterText: '00', labelText: 'Country'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 3,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 10) {
                          setState(() {
                            validate = true;
                          });
                        }
                        if (value.length < 10) {
                          setState(() {
                            validate = false;
                          });
                        }
                      },
                      autofocus: true,
                      maxLength: 10,

                      // textAlignVertical: TextAlignVertical.bottom,
                      keyboardType: TextInputType.phone,
                      controller: phoneNumberController,
                      // onChanged: (value) {
                      //   setState(() {
                      //     counterText = value.length.toString();
                      //   });
                      // },
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(bottom: 22, top: 22),
                        labelText: 'Number',
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AbsorbPointer(
            absorbing: validate ? false : true,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: validate
                    ? MaterialStateProperty.all(Theme.of(context).primaryColor)
                    : MaterialStateProperty.all(Colors.grey),
              ),
              onPressed: () {
                String number =
                    '${countryCodeController.text}${phoneNumberController.text}';
                showAlertDialog(context);
                _service.verifyPhoneNumber(context, number);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
