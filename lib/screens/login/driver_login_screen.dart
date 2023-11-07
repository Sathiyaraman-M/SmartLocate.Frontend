import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_locate/screens/login/driver_otp_screen.dart';

class DriverLoginScreen extends StatelessWidget {
  const DriverLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ChangeNotifierProvider(
              create: (context) => _DriverLoginState(),
              builder: (context, child) {
                final provider = Provider.of<_DriverLoginState>(context);
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
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 5, left: 10, right: 10),
                        child: const Text(
                          'Driver Login',
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: provider.phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          contentPadding: EdgeInsets.only(
                              left: 20, bottom: 0, top: 0, right: 20),
                          labelText: 'Mobile Number',
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () => provider.goToOtpScreen(context),
                              child: const Text(
                                'Get OTP',
                              ),
                            ))),
                  ],
                );
              })),
    );
  }
}

class _DriverLoginState extends ChangeNotifier {
  final phoneNumberController = TextEditingController();

  void goToOtpScreen(BuildContext context) {
    if (phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter a valid phone number'),
      ));
      return;
    }
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const DriverOtpScreen())));
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
}
