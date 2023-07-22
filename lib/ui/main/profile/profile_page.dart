
import 'package:flutter/material.dart';
import 'package:untitled/router/Router.dart';

import '../../constant/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              height: 46,
              color: const Color(0xFF39465B),
              onPressed:(){
                Routers.push(context,Routers.registerMainPage);
              },
              child: const Text(
                'Login',
                style: TextStyle(color: textWhite),
              ),
            )
          ],
        ),
      ),
    );
  }
}
