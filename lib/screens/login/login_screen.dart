import 'package:flutter/material.dart';
import 'package:smart_locate/screens/login/driver_login_screen.dart';
import 'package:smart_locate/screens/login/student_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _currentScreen = const StudentLoginScreen();

  void switchScreen() {
    setState(() {
      if (_currentScreen is StudentLoginScreen) {
        _currentScreen = const DriverLoginScreen();
      } else {
        _currentScreen = const StudentLoginScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _currentScreen),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Switch to '),
              TextButton(
                child: Center(
                    child: Text(
                  _currentScreen is StudentLoginScreen
                      ? 'Driver Login'
                      : 'Student Login',
                )),
                onPressed: () {
                  setState(() {
                    switchScreen();
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
