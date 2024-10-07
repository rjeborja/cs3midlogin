import 'package:cs3midlogin/landingpage.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'homescreen.dart';
import 'landingpage.dart';
import 'navigation_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.05;
    final topPadding = screenSize.height * 0.1;
    final bottomPadding = screenSize.height * 0.05;
    final buttonWidth = screenSize.width * 0.45;
    final buttonHeight = screenSize.height * 0.07;
    final iconSize = 40.0;

    return Scaffold(
        backgroundColor: const Color(0xFFEFEBF2),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        padding, topPadding, padding, bottomPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const TextField(
                          keyboardType: TextInputType.name,
                          style: TextStyle(color: Color(0xFF7E01FB)),
                          decoration: InputDecoration(
                              hintText: 'First Name',
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF7E01FB)))),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          keyboardType: TextInputType.name,
                          style: TextStyle(color: Color(0xFF7E01FB)),
                          decoration: InputDecoration(
                              hintText: 'Last Name',
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF7E01FB)))),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Color(0xFF7E01FB)),
                          decoration: InputDecoration(
                              hintText: 'Email Address',
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF7E01FB)))),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Color(0xFF7E01FB)),
                          decoration: InputDecoration(
                              hintText: 'Username',
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF7E01FB)))),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          obscureText: true,
                          style: TextStyle(color: Color(0xFF7E01FB)),
                          decoration: InputDecoration(
                              hintText: 'Password',
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF7E01FB)))),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          obscureText: true,
                          style: TextStyle(color: Color(0xFF7E01FB)),
                          decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF7E01FB)))),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidth,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF7E01FB),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              child: const Text('Sign Up')),
                        ),
                        SizedBox(height: bottomPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('Sign Up with',
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.center),
                            SizedBox(width: 10),
                            IconButton(
                                iconSize: iconSize,
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue,
                                )),
                            SizedBox(width: 10),
                            IconButton(
                                iconSize: iconSize,
                                onPressed: () {
                                  pushWithSlideTransition(
                                      context, const LandingPage());
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.google,
                                )),
                          ],
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInScreen()));
                        },
                        child: const Text('Log In',
                            style: TextStyle(color: Color(0xFF7E01FB))))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
