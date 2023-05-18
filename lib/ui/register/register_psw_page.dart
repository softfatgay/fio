import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/app_bar.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';
import 'package:flutter/material.dart';

class RegisterPswPage extends StatefulWidget {
  final Map? params;

  const RegisterPswPage({Key? key, this.params}) : super(key: key);

  @override
  State<RegisterPswPage> createState() => _RegisterPswPageState();
}

class _RegisterPswPageState extends State<RegisterPswPage> {
  var _pswEnable = false;
  final _pswController = TextEditingController();
  var _pswConfirmEnable = false;
  final _pswConfirmController = TextEditingController();

  String name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print("================================");
      name = widget.params!['name'];
      print(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Creat account'),
      body: _buildContet(),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: ScreenMargin.TOSCREEN, vertical: 20),
        width: double.infinity,
        child: MaterialButton(
          height: 46,
          color: const Color(0xFF39465B),
          onPressed: _goNext,
          child: const Text(
            'Continue',
            style: TextStyle(color: textWhite),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildContet() {
    return Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Create a password', style: t16black),
            const SizedBox(height: 6),
            _buildPswTextFiled('Type your password', _pswEnable, _pswController,
                () {
              setState(() {
                _pswEnable = !_pswEnable;
              });
            }),
            const SizedBox(height: 40),
            const Text('Confirm password', style: t16black),
            const SizedBox(height: 6),
            _buildPswTextFiled('Repeat your password', _pswConfirmEnable,
                _pswConfirmController, () {
              setState(() {
                _pswConfirmEnable = !_pswConfirmEnable;
              });
            }),
          ],
        ));
  }

  Widget _buildPswTextFiled(String hintText, bool pswEnable,
      TextEditingController pswController, Function iconPress) {
    return TextField(
      keyboardType: TextInputType.text,
      obscureText: pswEnable,
      controller: pswController,
      style: t14black,
      textAlign: TextAlign.start,
      inputFormatters: [],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        fillColor: Colors.white,
        hintStyle: t12grey,
        disabledBorder: _disabledBorder(),
        enabledBorder: _disabledBorder(),
        focusedBorder: _disabledBorder(),
        hintText: '$hintText',
        counterText: '',
        suffixIcon: IconButton(
          icon: Icon(
            pswEnable ? Icons.remove_red_eye : Icons.dnd_forwardslash,
            color: Colors.grey,
          ),
          onPressed: () {
            iconPress();
          },
        ),
      ),
    );
  }

  void _goNext() {
    Routers.push(context, Routers.registerVerifyEmail, {
      "form": {
        'name': name,
        'psw': _pswController.text,
        'pswConfirm': _pswConfirmController.text,
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pswConfirmController.dispose();
    _pswController.dispose();
    super.dispose();
  }
}

_disabledBorder() => OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0xFFE1E1E1),
      width: 1,
    ),
    borderRadius: BorderRadius.circular(2));
