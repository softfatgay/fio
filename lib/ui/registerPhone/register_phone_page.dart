import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/circle_button.dart';
import 'package:untitled/ui/component/normal_button.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

import '../component/app_bar.dart';
import '../component/fonts.dart';
import '../component/text_field.dart';

class RegisterPhonePage extends StatefulWidget {
  final Map? params;

  const RegisterPhonePage({Key? key, this.params}) : super(key: key);

  @override
  State<RegisterPhonePage> createState() => _RegisterPhonePageState();
}

class _RegisterPhonePageState extends State<RegisterPhonePage> {
  final _textEditingController = TextEditingController();
  var _phone = "";
  var _countryCode = "";
  Timer? _timer;
  var _currentTime = 0;
  var _totalTime = 6;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _phone = widget.params!['phone'].toString();
      _countryCode = widget.params!['code'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Create account'),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Te enviamos un código de seguridad por ensaje de texto a +$_countryCode $_phone',
                  style: t14black,
                ),
                const SizedBox(height: 20),
                NormalTextField(
                  hintText: 'Write the code',
                  controller: _textEditingController,
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NormalButton(
                  text: 'Verify code',
                  onPressed: () {
                    Routers.push(context, Routers.registerCreateUserName);
                  },
                ),
                const SizedBox(
                  height: ScreenMargin.TOP,
                ),
                CircleButton(
                  text: _currentTime == 0 ? 'Send code again' : 'Send code again in ${_totalTime - _currentTime}',
                  color: _currentTime == 0 ? appBlue: appWhite,
                  textColor: _currentTime == 0 ? textWhite : textGrey,
                  onPressed: () {
                    if (_currentTime == 0) {
                      _startTimer();
                    }
                    print("object");
                  },
                ),
                const SizedBox(
                  height: ScreenMargin.TOP * 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _startTimer(){
    _timer  = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime++;
      });
      if (_currentTime == _totalTime) {
        _currentTime = 0;
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    _textEditingController.dispose();
    super.dispose();
  }
}
