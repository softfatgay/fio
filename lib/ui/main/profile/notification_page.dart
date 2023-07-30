
import 'package:flutter/material.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

import '../../component/fonts.dart';
import '../../constant/colors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  var _data = ["Añadir noticia", "Solicitudes", "Solicitudes"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: backColor,
        title: Text(
          'Notifications',
          style: t18black,
        ),
        titleSpacing: 0,
      ),
      body: _buildContent(),
    );
  }

  _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
      child: SingleChildScrollView(
        child: Column(
          children: _data.map<Widget>((e) => _buildItem(e)).toList(),
        ),
      ),
    );
  }

  _buildItem(String e) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN,vertical: ScreenMargin.TOSCREEN),
      decoration: BoxDecoration(
          color: appWhite, borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          const Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is a new, like a notice, it has 2 lines...',
                style: t16black,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10,),
              Text(
                '3 days ago...',
                style: t12grey,
              ),
            ],
          )),
          const SizedBox(width: 24,),
          Image.asset('assets/icons/place_holder.png',width: 70,height: 70,),
        ],
      ),
    );
  }
}
