import 'package:flutter/material.dart';
import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/circle_button.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/label_widget.dart';
import 'package:untitled/ui/component/normal_button.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

import '../../constant/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _loginState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F8),
      appBar: _loginAppBar(),
      body: _loginView(),
    );
  }

  _logoutAppBar() {
    return AppBar(
      title: const Text(
        'To do this you need to Login',
        style: t12Red,
      ),
      leading: Container(),
      leadingWidth: 0,
      backgroundColor: const Color(0xFFFBF3D6),
    );
  }

  _loginAppBar() {
    return AppBar(leading: Container(), actions: [
      IconButton(
          onPressed: () {
            _showProfile();
          },
          icon: Icon(Icons.menu))
    ]);
  }

  _logoutView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Welcome back', style: t20blackBold),
          const SizedBox(height: 38),
          PreIconNormalButton(
            text: 'Continue with Phone',
            icon: 'assets/icons/smartphone.png',
            onPressed: () {
              Routers.push(context, Routers.registerMainPage);
            },
          ),
          const SizedBox(height: ScreenMargin.TOP),
          PreIconCircleButton(
            text: 'Continue with Email',
            icon: 'assets/icons/mail.png',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _loginView() {
    return Container(
      color: appWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _profile(),
          const SizedBox(height: 25),
          Container(height: 10, color: Color(0xFFF1F3F8)),
          LabelView(text: 'Personal data', onPressed: () {}),
          LabelView(text: 'Users common 2', onPressed: () {}),
          LabelView(text: 'Notas', elevation: 0.0, onPressed: () {}),
          Container(height: 10, color: Color(0xFFF1F3F8)),
          LabelView(text: 'History', elevation: 0.0, onPressed: () {}),
        ],
      ),
    );
  }

  _profile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/icon_head.png',
                width: 85,
                height: 85,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alice prestok',
                    style: t20black,
                  ),
                  Text(
                    'Alice',
                    style: t14grey,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 25),
          NormalButton(text: 'Solicitar Edicion De Datos', onPressed: () {}),
        ],
      ),
    );
  }

  _showProfile() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(
                horizontal: ScreenMargin.TOSCREEN, vertical: 20),
            color: appWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Personal data',
                      style: t16black,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
                const SizedBox(height: 24,),
                Text('D.N.I.',style: t16grey,),
                Text('33888333',style: t16black,),
                const SizedBox(height: 24,),
                Text('Fecha de Nacimiento',style: t16grey,),
                Text('12/02/1970',style: t16black,),
                const SizedBox(height: 24,),
                Text('Sexo',style: t16grey,),
                Text('Mujer',style: t16black,),
                const SizedBox(height: 24,),
                Text('Comunidad',style: t16grey,),
                Text('No data',style: t16black,),
              ],
            ),
          );
        });
  }
}
