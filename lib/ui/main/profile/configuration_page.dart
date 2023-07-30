import 'package:flutter/material.dart';
import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/label_widget.dart';
import 'package:untitled/ui/component/normal_button.dart';
import 'package:untitled/ui/constant/colors.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: backColor,
        title: Text(
          'Configuration',
          style: t18black,
        ),
        titleSpacing: 0,
      ),
      body: _buildContent(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NormalButton(text: 'Log Out', onPressed: () {}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _buildContent() {
    return Container(
      color: appWhite,
      child: Column(
        children: [
          LabelView(text: 'Profile', onPressed: () {}),
          LabelView(text: 'Login info', onPressed: () {}),
          LabelView(
              text: 'Push notifications', elevation: 0.0, onPressed: () {

          }),
          Container(height: 10, color: backColor),
          LabelView(text: 'Languaje', elevation: 0.0, onPressed: () {}),
          Container(height: 10, color: backColor),
          LabelView(text: 'Support', elevation: 0.0, onPressed: () {}),
          Container(height: 10, color: backColor),
          LabelView(text: 'Terms of use', onPressed: () {}),
          LabelView(text: 'Privacy policy', onPressed: () {}),
          LabelView(text: 'Stats', onPressed: () {}),
          LabelView(text: 'Version', elevation: 0.0, onPressed: () {}),
        ],
      ),
    );
  }
}
