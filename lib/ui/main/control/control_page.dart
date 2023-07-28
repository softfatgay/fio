import 'package:flutter/material.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/label_widget.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

class ControlPanelPage extends StatefulWidget {
  const ControlPanelPage({Key? key}) : super(key: key);

  @override
  State<ControlPanelPage> createState() => _ControlPanelPageState();
}

class _ControlPanelPageState extends State<ControlPanelPage> {
  var _data = ["Añadir noticia", "Solicitudes"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: appBlue,
        leading: Container(),
        leadingWidth: 0.0,
        title: Text(
          'Control panel',
          style: t18white,
        ),
      ),
      body: _buildContent(),
    );
  }

  _buildContent() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: _data.map<Widget>((e) => _buildItem(e)).toList(),
        ),
      ),
    );
  }

  _buildItem(String e) {
    print('-----------------${_data.indexOf(e)}');
    print('-----------------${_data.length - 1}');
    return Container(
      color: appWhite,
      child: Column(
        children: [
          LabelView(
              elevation: 0,
              text: e,
              onPressed: () {}),
          if(_data.indexOf(e) != _data.length - 1) Container(margin:EdgeInsets.only(left: ScreenMargin.TOSCREEN),height: 1,color: backColor,)
        ],
      ),
    );
  }
}
