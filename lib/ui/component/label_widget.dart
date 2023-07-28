import 'dart:ffi';

import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'fonts.dart';

class LabelView extends MaterialButton {
  LabelView(
      {super.key,
      required super.onPressed,
      String text = '',
      Color color = appWhite,
      String icon = '',
      double height = 64,
      double elevation = 0.4})
      : super(
          minWidth: double.maxFinite,
          height: height,
          color: appWhite,
          elevation: elevation,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: t14black,
              ),
              const Icon(Icons.arrow_forward_ios,size: 16,),
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
