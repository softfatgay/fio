import 'package:flutter/material.dart';
import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/text_field.dart';
import '../component/app_bar.dart';
import '../constant/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _textController = TextEditingController();
  String _countryCode = "34";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.close)),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Text(
                    'Welcome back',
                    style: t20blackBold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    PreTextTextField(
                      prefixText: '+$_countryCode',
                      controller: _textController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    MaterialButton(
                      minWidth: double.maxFinite,
                      height: 46,
                      color: const Color(0xFF1778F2),
                      onPressed: () {
                        Routers.push(context, Routers.registerPhonePage, {
                          "phone": _textController.text,
                          'code': _countryCode
                        });
                      },
                      child: const Text(
                        'Sign up now',
                        style: TextStyle(color: textWhite),
                      ),
                    ),
                    const SizedBox(height: 80),
                    const Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: textBlue,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: textBlue,
                        fontWeight: fontWeightMedium,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
