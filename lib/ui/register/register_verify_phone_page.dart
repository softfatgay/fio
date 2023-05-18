import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/app_bar.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/text_field.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';
import 'package:flutter/material.dart';

class RegisterVerifyPhone extends StatefulWidget {
  final Map? params;

  const RegisterVerifyPhone({Key? key, this.params}) : super(key: key);

  @override
  State<RegisterVerifyPhone> createState() => _RegisterVerifyPhoneState();
}

class _RegisterVerifyPhoneState extends State<RegisterVerifyPhone> {
  Map? params;
  final _textController = TextEditingController();
  final _textCodeController = TextEditingController();
  var _sendCode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      params = widget.params;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Create account'),
      body: _buildBody(),
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

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text('Verify your telephone', style: t20black),
              const SizedBox(height: 20),
              Text(
                  !_sendCode ? 'We will send you a code to verify your phone number' : 'to enviamos un codigo de seguridad par ensaje de texto a +34 12345',
                  style: t14black),
              const SizedBox(height: 20),
              !_sendCode
                  ? PreTextTextField(
                      prefixText: '34',
                      controller: _textController,
                      keyboardType: TextInputType.number,
                    )
                  : Container(),
              _sendCode
                  ? NormalTextField(
                      hintText: 'Write the code',
                      controller: _textCodeController,
                      keyboardType: TextInputType.number,
                    )
                  : Container(),
            ],
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _sendCode
                  ? MaterialButton(
                      height: 46,
                      color: const Color(0xFF39465B),
                      onPressed: _goNext,
                      child: const Text(
                        'Verify code',
                        style: TextStyle(color: textWhite),
                      ),
                    )
                  : Container(),
              const SizedBox(height: 10),
              _sendCode
                  ? Container(
                      height: 44,
                      decoration:
                          BoxDecoration(border: Border.all(color: textGrey)),
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
          )
        ],
      ),
    );
  }

  void _continue() {
    setState(() {
      _sendCode = true;
    });
  }

  void _goNext() {
    Routers.push(context, Routers.registerVerifyPhone, {
      "form": {
        'name': params!['name'],
        'psw': params!['psw'],
        'pswConfirm': params!['pswConfirm'],
        'sendCode': params!['sendCode'],
      }
    });
  }
}
