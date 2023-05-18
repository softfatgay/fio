import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/app_bar.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/text_field.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';
import 'package:flutter/material.dart';

class RegisterVerifyEmail extends StatefulWidget {
  final Map? params;

  const RegisterVerifyEmail({Key? key, this.params}) : super(key: key);

  @override
  State<RegisterVerifyEmail> createState() => _RegisterVerifyEmailState();
}

class _RegisterVerifyEmailState extends State<RegisterVerifyEmail> {
  Map? params;
  final _textEditingController = TextEditingController();
  var _sendCode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      params = widget.params!['form'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Create account'),
      body: _buildContent(),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: ScreenMargin.TOSCREEN, vertical: 20),
        width: double.infinity,
        child: !_sendCode
            ? MaterialButton(
                height: 46,
                color: const Color(0xFF39465B),
                onPressed: _continue,
                child: const Text(
                  'Continue',
                  style: TextStyle(color: textWhite),
                ),
              )
            : Container(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _continue() {
    setState(() {
      _sendCode = true;
    });
  }

  void _goNext() {
    Routers.push(context, Routers.registerVerifyPhone,{
      "form": {
        'name': params!['name'],
        'psw': params!['psw'],
        'pswConfirm': params!['pswConfirm'],
        'sendCode': _textEditingController.text,
      }
    });
  }

  Widget _buildContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text('Verify your email', style: t20black),
                const SizedBox(height: 20),
                const Text(
                    'We will sed you a email with your code to verification your email to \"my  mail\"',
                    style: t14black),
                const SizedBox(height: 20),
                _sendCode
                    ? NormalTextField(
                        hintText: 'Write the code',
                        controller: _textEditingController,
                      )
                    : Container()
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _sendCode ? MaterialButton(
                  height: 46,
                  color: const Color(0xFF39465B),
                  onPressed: _goNext,
                  child: const Text(
                    'Verify code',
                    style: TextStyle(color: textWhite),
                  ),
                )
                    : Container(),
                SizedBox(height: 10),
                _sendCode ? Container(
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(color: textGrey)
                  ),
                  child: MaterialButton(
                    height: 42,
                    onPressed: _goNext,
                    child: const Text(
                      'Send code again in 59',
                      style: TextStyle(color: textGrey),
                    ),
                  ),
                )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
