import 'package:flutter/material.dart';
import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/circle_button.dart';
import 'package:untitled/ui/component/normal_button.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

import '../component/app_bar.dart';
import '../component/fonts.dart';

class RegisterMainPage extends StatefulWidget {
  const RegisterMainPage({Key? key}) : super(key: key);

  @override
  State<RegisterMainPage> createState() => _RegisterMainPageState();
}

class _RegisterMainPageState extends State<RegisterMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ''),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Expanded(
              child: Text('Welcome back', style: t20blackBold),
            ),
            Column(
              children: [
                NormalButton(text: 'Continue with Phone', onPressed: () {
                  Routers.push(context, Routers.loginPage);
                }),
                const SizedBox(
                  height: ScreenMargin.TOSCREEN,
                ),
                GestureDetector(
                  child: Container(
                    width: double.maxFinite,
                    height: 46,
                    decoration: BoxDecoration(
                        border: Border.all(color: appGrey, width: 1),
                        borderRadius: BorderRadius.circular(4)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 16,
                          height: 22,
                          width: 22,
                          child: Image.asset('assets/icons/google.png'),
                        ),
                        const Text(
                          'Continue with Email',
                          style: t14black,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Routers.push(context, Routers.registerUserNamePage);
                  },
                ),
                const SizedBox(height: 20),
                const Text('By continuing, you agree to accept our \n Privacy Policy & Terms of Service.',style: t12grey,textAlign: TextAlign.center,),
                const SizedBox(height: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
