import 'package:flutter/material.dart';
import 'package:untitled/ui/constant/colors.dart';

class ImgPlaceHolder extends StatelessWidget {
  final double? fontSize;

  const ImgPlaceHolder({Key? key, this.fontSize = 23}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 0.5)),
      child: Transform.rotate(
        angle: 0.75,
        child: Text(
          'FIO',
          style: TextStyle(
              color: textWhite,
              fontSize: fontSize,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
