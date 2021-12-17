// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../notifiers/User_Notifier.dart';
import '../routing/routes.dart';
import '../utils/action.dart';
import '../utils/colors.dart';
import '../utils/env.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _loginFormKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserNotifier>(builder: (context, notifier, _) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Form(
          key: _loginFormKey,
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
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
                        )
                      ],
                    ),
                    width: double.infinity,
                    height: 300,
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
                  elevation: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: TextFormField(
                    controller: mobileController,
                    onChanged: (String value) {},
                    cursorColor: RED,
                    decoration: const InputDecoration(
                      hintText: "Mobile Number",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.email,
                          color: RED,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your phone number';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 1.0,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: TextFormField(
                    controller: passwordController,
                    onChanged: (String value) {},
                    cursorColor: RED,
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
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          Autenticate(context, notifier);
                        }
                      },
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "FORGET PASSWORD ?",
                  style: TextStyle(
                      color: GRAY, fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, register);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Don't have an Account ? ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    Text("Sign Up ",
                        style: TextStyle(
                            color: RED,
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
    });
  }

  Autenticate(BuildContext context, UserNotifier notifier) async {
    final pr = await showLoading(context, message: "Please wait...");
    var response = await notifier.login(
        mobile_number: mobileController.text,
        password: passwordController.text);
    await closeLoading(pr);
    print("respoonse" + response.toString());
    if (response["user"] == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response["response"]["Message"] ?? "")));
    } else {
      notifier.user = response["user"];
      Navigator.pushNamed(context, home);
    }
  }
}
