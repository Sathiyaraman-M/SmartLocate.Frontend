import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_locate/screens/main_screen.dart';

class StudentLoginScreen extends StatelessWidget {
  const StudentLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ChangeNotifierProvider(
            create: (context) => _StudentLoginState(),
            builder: (context, child) => const _StudentLoginBody(),
          )),
    );
  }
}

class _StudentLoginBody extends StatelessWidget {
  const _StudentLoginBody();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_StudentLoginState>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color(0xFF6200EE)),
            child: const Text(
              'SMART LOCATE',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            )),
        Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: const Text(
              'Student Login',
              style: TextStyle(fontSize: 20),
            )),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: provider.regNumberController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              contentPadding:
                  EdgeInsets.only(left: 20, bottom: 0, top: 0, right: 20),
              labelText: 'Register Number',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            obscureText: true,
            controller: provider.passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              contentPadding:
                  EdgeInsets.only(left: 20, bottom: 0, top: 0, right: 20),
              labelText: 'Password',
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      autofocus: true,
                      onPressed: () => provider.login(context),
                      child: const Text(
                        'LOGIN',
                      ),
                    ))
              ],
            )),
      ],
    );
  }
}

class _StudentLoginState extends ChangeNotifier {
  final regNumberController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context) {
    if (regNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter your register number'),
      ));
      return;
    }
    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter your password'),
      ));
      return;
    }
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => const MainScreen())),
        (_) => false);
  }

  @override
  void dispose() {
    regNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
