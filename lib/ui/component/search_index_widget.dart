import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/constant/colors.dart';

typedef void OnValueChanged(String value);
typedef void OnSubmitted(String value);

class SearchIndexWidget extends StatefulWidget {
  final String? textValue;
  final double paddingV;

  ///{@macro 输入框变化,回调时间,默认500毫秒}
  final int textChangeDuration;
  final String? hintText;
  final double searchHeight;
  final TextEditingController controller;
  final OnValueChanged? onValueChangedCallBack;
  final OnSubmitted? onSubmitted;
  final bool? suffixButton;

  SearchIndexWidget(
      {this.textValue = '',
      this.searchHeight = 45.0,
      this.paddingV = 8,
      required this.controller,
      this.hintText,
      this.textChangeDuration = 500,
      this.onValueChangedCallBack,
      this.onSubmitted,
      this.suffixButton = false});

  @override
  _SearchGoodsState createState() => _SearchGoodsState();
}

class _SearchGoodsState extends State<SearchIndexWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    // if (widget.controller == null) {
    //   throw Exception('TextEditingController 没有初始化');
    // }
    setState(() {
      _controller = widget.controller;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.controller == null) {
    //   throw Exception('TextEditingController 没有初始化');
    // }
    return Container(
      decoration: BoxDecoration(
          color: backGrey, borderRadius: BorderRadius.circular(4)),
      height: widget.searchHeight,
      child: TextField(
        style: t14black,
        decoration: InputDecoration(
          hintText: widget.hintText ?? '',
          border: InputBorder.none,
          prefixIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:const Icon(Icons.arrow_back),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _controller.clear();
                widget.onValueChangedCallBack!('');
              });
            },
            icon:const Icon(Icons.clear),
          ),
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: (text) {
          //回车按钮
          setState(() {
            if (widget.onSubmitted != null) {
              widget.onSubmitted!(text);
            }
          });
        },
        maxLines: 1,
        onChanged: (textValue) {
          _startTimer(textValue);
        },
        controller: _controller,
      ),
    );
  }

  Timer? timer;

  _startTimer(String value) {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: widget.textChangeDuration), () {
      setState(() {
        // _controller.text = value.trim();
        if (widget.onValueChangedCallBack != null) {
          widget.onValueChangedCallBack!(_controller.text);
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (timer != null) {
      timer!.cancel();
      timer = null;
    }
  }
}
