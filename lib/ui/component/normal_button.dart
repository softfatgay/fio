import 'package:flutter/material.dart';
import 'package:untitled/ui/constant/colors.dart';

class NormalButton extends MaterialButton {
  NormalButton(
      {super.key,
      required super.onPressed,
      String text = '',
      Color color = appWhite})
      : super(
          minWidth: double.maxFinite,
          height: 46,
          color: appBlue,
          child: Text(
            text,
            style: const TextStyle(color: textWhite),
          ),
          shape: const RoundedRectangleBorder(
            //边框圆角
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        );
}
