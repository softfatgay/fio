import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/main/main_page.dart';
import 'package:untitled/ui/register/register_user_name.dart';
import 'package:untitled/utils/LogUtil.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: appWhite,
        primaryColor: Color(0xFF36465D),
      ),
      home: const MainPage(),
      onGenerateRoute: (RouteSettings settings) {
        return Routers.run(settings);
      },
      initialRoute: Routers.mainPage,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    print(1111111111111111);
    setState(() {
      _counter++;
    });
  }

  void _goRegister() {
    Routers.push(context,Routers.registerUserNamePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goRegister,
        tooltip: 'Increment',
        child: TextButton(onPressed: _goRegister, child: Text('login')),
      ),
    );
  }

}
