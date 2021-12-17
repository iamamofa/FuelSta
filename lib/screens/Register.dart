// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../utils/action.dart';
import '../arguments/OtpArgs.dart';
import '../resources/AuthRepo.dart';
import '../routing/routes.dart';
import '../utils/colors.dart';
import '../utils/env.dart';
import '../models/User.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final fullNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Form(
        key: _signUpFormKey,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                        LOGO,
                        width: 150,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        DESCRIPTION,
                        style: TextStyle(fontSize: 18, color: GRAY),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)])),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 1.0,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: TextFormField(
                  controller: fullNameController,
                  cursorColor: RED,
                  decoration: const InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.person,
                        color: RED,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your full name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 1.0,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: TextFormField(
                  cursorColor: RED,
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Email Address",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.phone,
                        color: RED,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid mobile number';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 1.0,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: TextFormField(
                  cursorColor: RED,
                  controller: mobileNumberController,
                  decoration: const InputDecoration(
                    hintText: "Mobile Number",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.phone,
                        color: RED,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid mobile number';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 1.0,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: TextFormField(
                  cursorColor: RED,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: RED,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 1.0,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: TextFormField(
                    controller: confirmPasswordController,
                    cursorColor: RED,
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.lock,
                          color: RED,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password again';
                      }
                      if (!value.isEmpty &&
                          passwordController.text.toString() !=
                              confirmPasswordController.text.toString()) {
                        return 'Enter your password again correctly';
                      }
                      return null;
                    }),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: YELLOW),
                  child: TextButton(
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    onPressed: () {
                      register(context);
                    },
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, login);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Already having an account ? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                  Text("Login ",
                      style: TextStyle(
                          color: YELLOW,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  register(BuildContext context) async {
    final pr = await showLoading(context, message: "Please wait");
    Map response = await AuthRepo().register(
        fullname: fullNameController.text,
        mobile_number: mobileNumberController.text,
        email: emailController.text,
        password: passwordController.text,
        latitude: latitude,
        longitude: longitude);
    await pr.hide();
    if (response["Status"] == 1) {
      print(response["Data"]["otp"]);
      Navigator.pushNamed(context, otp,
          arguments: OtpArgs(response["Data"]["otp"], response["Data"]["phone"],
              User.fromJson(response["Data"])));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response["Message"] ?? "")));
    }
  }
}
