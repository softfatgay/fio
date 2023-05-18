
import 'package:flutter/material.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

import 'fonts.dart';

class NormalTextField extends TextField {
  NormalTextField({
    super.key,
    final TextEditingController? controller,
    final int maxlines = 1,
    int? maxLength,
    bool enabled = true,
    String counterText = '',
    String prefixText = '',
    TextInputType? keyboardType = TextInputType.text,
    String hintText = '',
  }) : super(
          keyboardType: keyboardType,
          obscureText: false,
          controller: controller,
          style: t14black,
          enabled: enabled,
          textAlign: TextAlign.start,
          inputFormatters: [],
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              fillColor: Colors.white,
              hintStyle: t12grey,
              disabledBorder: _disabledBorder(),
              enabledBorder: _disabledBorder(),
              focusedBorder: _disabledBorder(),
              hintText: '$hintText',
              counterText: ''),
        );
}

class PreTextTextField extends TextField {
  PreTextTextField({
    super.key,
    final TextEditingController? controller,
    final int maxlines = 1,
    int? maxLength,
    bool enabled = true,
    String counterText = '',
    String prefixText = '',
    TextInputType? keyboardType = TextInputType.text,
    String hintText = '',
  }) : super(
          keyboardType: keyboardType,
          obscureText: false,
          controller: controller,
          style: t14black,
          enabled: enabled,
          textAlign: TextAlign.start,
          inputFormatters: [],
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              fillColor: Colors.white,
              hintStyle: t12grey,
              disabledBorder: _disabledBorder(),
              enabledBorder: _disabledBorder(),
              focusedBorder: _disabledBorder(),
              prefixIcon: prefixText.isNotEmpty
                  ? Container(
                      width: 50,
                      padding: const EdgeInsets.only(left: ScreenMargin.TOSCREEN),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$prefixText',
                        style: TextStyle(),
                      ),
                    )
                  : Container(width: 0),
              hintText: '$hintText',
              counterText: ''),
        );
}

_disabledBorder() => OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0xFFE1E1E1),
      width: 1,
    ),
    borderRadius: BorderRadius.circular(2));

class PswTextField extends TextField {
  PswTextField({
    super.key,
    final TextEditingController? controller,
    final int maxlines = 1,
    int? maxLength,
    bool enabled = true,
    String counterText = '',
    String prefixText = '',
    TextInputType? keyboardType,
    String hintText = '',
    bool pswEnable = false,
    Function? iconPress,
  }) : super(
          keyboardType: TextInputType.text,
          obscureText: pswEnable,
          controller: controller,
          style: t14black,
          enabled: enabled,
          textAlign: TextAlign.start,
          inputFormatters: [],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            fillColor: Colors.white,
            hintStyle: t12grey,
            disabledBorder: _disabledBorder(),
            enabledBorder: _disabledBorder(),
            focusedBorder: _disabledBorder(),
            hintText: '$hintText',
            counterText: '',
            suffixIcon: IconButton(
              icon: Icon(
                pswEnable ? Icons.remove_red_eye : Icons.dnd_forwardslash,
                color: Colors.grey,
              ),
              onPressed: () {
                if (iconPress != null) {
                  iconPress();
                }
              },
            ),
          ),
        );
}
