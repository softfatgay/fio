import 'package:untitled/main.dart';
import 'package:untitled/ui/main/main_page.dart';
import 'package:untitled/ui/register/register_verify_phone_page.dart';
import 'package:untitled/ui/register/register_psw_page.dart';
import 'package:untitled/ui/register/register_user_name.dart';
import 'package:untitled/ui/register/register_verify_send_code_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routers {
  static const String homePage = '/';
  static const String mainPage = '/MainPage';
  static const String registerUserNamePage = '/registerPage';
  static const String registerPswPage = '/registerPswPage';
  static const String registerVerifyEmail = '/registerVerifyEmail';
  static const String registerVerifyPhone = '/registerVerifyPhone';

  static Map<String, Function> routes = {
    ///首页
    mainPage: (context, {params}) => const MainPage(),
    homePage: (context, {params}) => const MyHomePage(title: ''),
    registerUserNamePage: (context, {params}) => const RegisterUserNamePage(),
    registerPswPage: (context, {params}) => RegisterPswPage(params: params),
    registerVerifyEmail: (context, {params}) =>
        RegisterVerifyEmail(params: params),
    registerVerifyPhone: (context, {params}) =>
        RegisterVerifyPhone(params: params),
  };

  ///组件跳转

  static link(Widget widget, String routeName, BuildContext context,
      [Map? params, Function? callBack]) {
    return GestureDetector(
      onTap: () {
        if (params != null) {
          Navigator.pushNamed(context, routeName, arguments: params)
              .then((onValue) {
            if (callBack != null) {
              callBack(onValue);
            }
          });
        } else {
          Navigator.pushNamed(context, routeName).then((onValue) {
            if (callBack != null) {
              callBack(onValue);
            }
          });
        }
      },
      child: widget,
    );
  }

  ///组件跳转
  static push(BuildContext context, String routeName,
      [Map? params, Function? callBack]) {
    if (params != null) {
      Navigator.pushNamed(context, routeName, arguments: params)
          .then((onValue) {
        if (callBack != null) {
          callBack(onValue);
        }
      });
    } else {
      Navigator.pushNamed(context, routeName).then((onValue) {
        if (callBack != null) {
          callBack(onValue);
        }
      });
    }
  }

  static run(RouteSettings routeSettings) {
    final Function? pageContentBuilder = Routers.routes[routeSettings.name!];
    if (pageContentBuilder != null) {
      if (routeSettings.arguments != null) {
        return MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, params: routeSettings.arguments));
      } else {
        // 无参数路由
        return MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
      }
    }
  }

  static pop(context) {
    Navigator.pop(context);
  }
}
