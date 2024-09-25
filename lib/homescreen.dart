import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'signupscreen.dart';
import 'navigation_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF7E01FB),
        body: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width > 600
                    ? 300
                    : MediaQuery.of(context).size.height * 0.3,
                child: Image.asset('assets/lamps.png',
                    fit: MediaQuery.of(context).size.width > 600
                        ? BoxFit.fitHeight
                        : BoxFit.cover),
              ),
              SizedBox(
                child: Image.asset('assets/desk.png'),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        pushWithSlideTransition(context, const LogInScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF7E01FB),
                        backgroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Log In'))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: ElevatedButton(
                    onPressed: () {
                      pushWithSlideTransition(context, const SignUpScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF7E01FB),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.white))),
                    child: const Text('Sign Up')),
              )
            ],
          )
        ]));
  }
}
