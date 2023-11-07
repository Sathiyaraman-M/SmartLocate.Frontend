import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_locate/screens/main_screen.dart';

class DriverOtpScreen extends StatelessWidget {
  const DriverOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ChangeNotifierProvider(
            create: (context) => _DriverOtpState(),
            builder: (context, child) {
              final provider = Provider.of<_DriverOtpState>(context);
              return Form(
                key: provider.formKey,
                child: Column(
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
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 10, left: 10, right: 10),
                        child: const Text(
                          'Enter OTP',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF6200EE),
                              fontWeight: FontWeight.w700),
                        )),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 68,
                                width: 64,
                                child: TextFormField(
                                  controller: provider.digit1Controller,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 68,
                                width: 64,
                                child: TextFormField(
                                  controller: provider.digit2Controller,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    } else {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 68,
                                width: 64,
                                child: TextFormField(
                                  controller: provider.digit3Controller,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    } else {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 68,
                                width: 64,
                                child: TextFormField(
                                  controller: provider.digit4Controller,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    } else {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ])),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () => provider.verifyOtp(context),
                              child: const Text(
                                'LOGIN',
                              ),
                            ))),
                  ],
                ),
              );
            },
          )),
    );
  }
}

class _DriverOtpState extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final digit1Controller = TextEditingController();
  final digit2Controller = TextEditingController();
  final digit3Controller = TextEditingController();
  final digit4Controller = TextEditingController();
  void verifyOtp(BuildContext context) {
    final otp = digit1Controller.text +
        digit2Controller.text +
        digit3Controller.text +
        digit4Controller.text;
    if (otp == '1234') {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: ((context) => const MainScreen())),
          (_) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid OTP'),
        ),
      );
    }
  }

  @override
  void dispose() {
    digit1Controller.dispose();
    digit2Controller.dispose();
    digit3Controller.dispose();
    digit4Controller.dispose();
    super.dispose();
  }
}
