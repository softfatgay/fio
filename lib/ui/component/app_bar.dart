
import 'package:flutter/material.dart';

import '../constant/colors.dart';

appBar(BuildContext context, String? title, {Function? onPressed}) {
  return AppBar(
    titleSpacing: 0,
    title: Text('$title'),
    leading: IconButton(
      focusColor: Color(0xFFF1F3F8),
      hoverColor: Color(0xFFF1F3F8) ,
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        if (onPressed!=null) {
          onPressed();
        }else{
          Navigator.pop(context);
        }
      },
    ),
    centerTitle: false,
    flexibleSpace: Container(
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: appWhite,
        boxShadow: [BoxShadow(color: appShadow, blurRadius: 0.5)],
      ),
    ),
  );
}
