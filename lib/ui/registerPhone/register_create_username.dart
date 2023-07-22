import 'package:flutter/material.dart';
import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/normal_button.dart';
import 'package:untitled/ui/component/text_field.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

import '../component/app_bar.dart';

class RegisterCreateUserName extends StatefulWidget {
  const RegisterCreateUserName({Key? key}) : super(key: key);

  @override
  State<RegisterCreateUserName> createState() => _RegisterCreateUserNameState();
}

class _RegisterCreateUserNameState extends State<RegisterCreateUserName> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Create account'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: ScreenMargin.TOSCREEN, vertical: 32),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose an username',
                      style: t14black,
                    ),
                    const SizedBox(height: ScreenMargin.TOSCREEN,),
                    NormalTextField(
                      hintText: '5 to 20 characters username',
                      controller: _textEditingController,
                    )
                  ],
                ),
              ),
              NormalButton(
                text: 'Continue',
                onPressed: (){
                  Routers.push(context, Routers.registerSetPassWord);
                },)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }
}
