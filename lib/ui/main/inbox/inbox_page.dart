import 'package:flutter/material.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

import '../../component/fonts.dart';
import '../../constant/colors.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
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
          'Inbox',
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
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(ScreenMargin.TOSCREEN),
      color: appWhite,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          'assets/icons/place_holder.png',
          width: 70,
          height: 70,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Personal data',
                style: t18black,
              ),
              Text(
                'We’ll use these details to keep you',
                style: t16grey,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),),
        ),
        Text(
          '20/11',
          style: t16grey,
        )
      ]),
    );
  }
}
