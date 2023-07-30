import 'package:untitled/main.dart';
import 'package:untitled/ui/main/detail/good_detail_page.dart';
import 'package:untitled/ui/main/main_page.dart';
import 'package:untitled/ui/registerPhone/login_page.dart';
import 'package:untitled/ui/register/register_verify_phone_page.dart';
import 'package:untitled/ui/register/register_psw_page.dart';
import 'package:untitled/ui/register/register_user_name.dart';
import 'package:untitled/ui/register/register_verify_send_code_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/main/control/solicitudes_page.dart';
import '../ui/main/control/solicitudes_resume_page.dart';
import '../ui/main/profile/configuration_page.dart';
import '../ui/main/profile/notification_page.dart';
import '../ui/main/search_index_page.dart';
import '../ui/register/regster_main_page.dart';
import '../ui/registerPhone/register_set_password.dart';
import '../ui/registerPhone/register_create_username.dart';
import '../ui/registerPhone/register_phone_page.dart';

class Routers {
  static const String homePage = '/';
  static const String mainPage = '/MainPage';
  static const String registerMainPage = '/registerMainPage';
  static const String registerUserNamePage = '/registerPage';
  static const String registerPswPage = '/registerPswPage';
  static const String registerVerifyEmail = '/registerVerifyEmail';
  static const String registerVerifyPhone = '/registerVerifyPhone';
  static const String searchIndexPage = '/searchIndexPage';
  static const String goodDetailPage = '/goodDetailPage';
  static const String loginPage = '/loginPage';
  static const String registerPhonePage = '/registerPhonePage';
  static const String registerCreateUserName = '/registerCreateUserName';
  static const String registerSetPassWord = '/registerSetPassWord';
  static const String configurationPage = '/configurationPage';
  static const String notificationPage = '/notificationPage';
  static const String solicitudesPage = '/solicitudesPage';
  static const String solicitudesResumePage = '/solicitudesResumePage';

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
    searchIndexPage: (context, {params}) => const SearchIndexPage(),
    goodDetailPage: (context, {params}) => GoodDetailPage(params: params),
    loginPage: (context, {params}) => const LoginPage(),
    registerPhonePage: (context, {params}) => RegisterPhonePage(params: params),
    registerCreateUserName: (context, {params}) =>
        const RegisterCreateUserName(),
    registerSetPassWord: (context, {params}) => const RegisterSetPassWord(),
    registerMainPage: (context, {params}) => const RegisterMainPage(),
    configurationPage: (context, {params}) => const ConfigurationPage(),
    notificationPage: (context, {params}) => const NotificationPage(),
    solicitudesPage: (context, {params}) => const SolicitudesPage(),
    solicitudesResumePage: (context, {params}) => SolicitudesResumePage(params: params),
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
