import 'package:flutter/material.dart';
import 'package:untitled/ui/constant/colors.dart';

class CircleButton extends MaterialButton {
  CircleButton({
    super.key,
    required super.onPressed,
    String text = '',
    Color color = appWhite,
    Color textColor = textGrey,
  }) : super(
          minWidth: double.maxFinite,
          height: 44,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          color: color,
          shape: const RoundedRectangleBorder(
            //边框颜色
            side: BorderSide(
              color: appBlue,
              width: 1,
            ),
            //边框圆角
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        );
}
