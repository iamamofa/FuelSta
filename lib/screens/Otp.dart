// ignore_for_file: file_names

import '../notifiers/User_Notifier.dart';
import 'package:provider/provider.dart';

import '../models/User.dart';
import '../resources/AuthRepo.dart';
import '../routing/routes.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:code_fields/code_fields.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Otp extends StatefulWidget {
  String token;
  String phone;
  User data;
  Otp(this.token, this.phone, this.data);
  @override
  State<StatefulWidget> createState() {
    return OtpState();
  }
}

class OtpState extends State<Otp> {
  final formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CountdownController controller = CountdownController();
  String? code;
  bool showcountdown = true;
  String resendText = 'Resend code';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 40, bottom: 10, left: 20),
                        child: Image.asset(
                          'assets/images/profile.png',
                          width: 120,
                          height: 120,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                        child: Text(
                          "OTP Verification",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Enter the 4-digit code sent to you at",
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${widget.phone}\t\t',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: YELLOW),
                                    ),
                                    const TextSpan(
                                      text: ' Edit',
                                      style: TextStyle(
                                          fontSize: 18, color: YELLOW),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Center(
                              child: CodeFields(
                                  validator: (code) {
                                    if (code != null && code.length < 4) {
                                      return "Please complete the code";
                                    }
                                    return null;
                                  },
                                  autofocus: true,
                                  fieldHeight: 70,
                                  fieldWidth: 70,
                                  length: 4,
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  inputDecoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                  onCompleted: (value) {
                                    code = value.toString();
                                  },
                                  onChanged: (value) {
                                    code = value.toString();
                                  }),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [YELLOW, YELLOW]),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              validateToken(context);
                              // formKey.currentState.save();
                            }
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(15),
                            child: const Text(
                              "Continue",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: showcountdown
                            ? null
                            : () {
                                resendToken(context);
                              },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              resendText,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            if (showcountdown)
                              Countdown(
                                controller: controller,
                                seconds: 60,
                                build: (BuildContext context, double time) =>
                                    Text(
                                  'in ' + time.round().toString() + ' s',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                interval: const Duration(milliseconds: 100),
                                onFinished: () {
                                  print('Timer is done!');
                                  setState(() {
                                    showcountdown = false;
                                  });
                                },
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              top: 30,
              left: 10,
            )
          ],
        ));
  }

  validateToken(BuildContext context) async {
    if (code == widget.token) {
      var response = await AuthRepo().verifyOtp(mobile_number: widget.phone);
      if (response["Status"] == 1) {
        await widget.data.save();
        Provider.of<UserNotifier>(context, listen: false).user = widget.data;
        Navigator.of(context).pushNamedAndRemoveUntil(home, (route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response["Message"])));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid Token Entered")));
    }
  }

  resendToken(BuildContext context) async {
    setState(() {
      resendText = 'Resending...';
    });
    var response = await AuthRepo().resendToken(widget.phone);
    setState(() {
      resendText = 'Resend code';
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response["Message"])));
    if (response["status"] == 1) {
      widget.token = response["token"];
      setState(() {
        showcountdown = true;
      });
    }
  }
}
