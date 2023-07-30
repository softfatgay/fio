import 'package:flutter/material.dart';
import 'package:untitled/ui/constant/colors.dart';

import 'fonts.dart';

class NormalButton extends MaterialButton {
  NormalButton({
    super.key,
    required super.onPressed,
    String text = '',
    Color color = appBlue,
    Color textColor = textWhite,
    double elevation = 2,
  }) : super(
          minWidth: double.maxFinite,
          height: 46,
          color: color,
          elevation: elevation,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          shape: const RoundedRectangleBorder(
            //边框圆角
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        );
}

class PreIconNormalButton extends MaterialButton {
  PreIconNormalButton(
      {super.key,
      required super.onPressed,
      String text = '',
      Color color = appWhite,
      String icon = ''})
      : super(
          minWidth: double.maxFinite,
          height: 46,
          color: appBlue,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: t14white,
              ),
            ],
          ),
          shape: const RoundedRectangleBorder(
            //边框圆角
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
          ),
        );
}
