import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/app_bar.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/text_field.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterUserNamePage extends StatefulWidget {
  const RegisterUserNamePage({Key? key}) : super(key: key);

  @override
  State<RegisterUserNamePage> createState() => _RegisterUserNameState();
}

class _RegisterUserNameState extends State<RegisterUserNamePage> {
  String textName = 'Hi,Fiomachao';
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Create account'),
      body: _buildContent(),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: ScreenMargin.TOSCREEN, vertical: 20),
        width: double.infinity,
        child: MaterialButton(
          height: 46,
          color: const Color(0xFF39465B),
          onPressed: _goNext,
          child: const Text(
            'Continue',
            style: TextStyle(color: textWhite),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: ScreenMargin.TOSCREEN),
            child: Text(
              textName,
              style: const TextStyle(
                  color: textBlack, fontWeight: FontWeight.w600, fontSize: 30),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Choose an name',
            style: t14black,
          ),
          const SizedBox(height: 6),
          NormalTextField(
            controller: _textEditingController,
            hintText: '5-20 characters username',
            keyboardType: TextInputType.text,
          )
        ],
      ),
    );
  }

  void _back() {}

  void _goNext() {
    print("================================");
    print(_textEditingController.text);
    Routers.push(context, Routers.registerPswPage, {'name': _textEditingController.text});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }
}
