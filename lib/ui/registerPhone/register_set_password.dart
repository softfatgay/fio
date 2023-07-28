import 'package:flutter/material.dart';
import 'package:untitled/ui/component/normal_button.dart';
import 'package:untitled/ui/component/text_field.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

import '../component/app_bar.dart';
import '../component/fonts.dart';

class RegisterSetPassWord extends StatefulWidget {
  const RegisterSetPassWord({Key? key}) : super(key: key);

  @override
  State<RegisterSetPassWord> createState() => _RegisterSetPassWordState();
}

class _RegisterSetPassWordState extends State<RegisterSetPassWord> {
  final _pswController = TextEditingController();
  final _pswConfirmController = TextEditingController();

  var _pswEnable = true;
  var _pswConfirmEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Create account'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ScreenMargin.TOSCREEN,
          vertical: 32,
        ),
        child: Column(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create a password',
                  style: t14black,
                ),
                const SizedBox(height: ScreenMargin.TOSCREEN,),
                PswTextField(
                  pswEnable: _pswEnable,
                  controller: _pswController,
                  iconPress: () {
                    setState(() {
                      _pswEnable = !_pswEnable;
                    });
                  },
                ),
                const SizedBox(height: 32),
                const Text(
                  'Confirm password',
                  style: t14black,
                ),
                const SizedBox(height: ScreenMargin.TOSCREEN,),
                PswTextField(
                  pswEnable: _pswConfirmEnable,
                  controller: _pswConfirmController,
                  iconPress: () {
                    setState(() {
                      _pswConfirmEnable = !_pswConfirmEnable;
                    });
                  },
                ),
              ],
            )),
            PreIconNormalButton(
                text: 'Continue',
                onPressed: (){}),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pswController.dispose();
    _pswConfirmController.dispose();
    super.dispose();
  }
}
