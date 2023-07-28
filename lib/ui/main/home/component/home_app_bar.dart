import 'package:flutter/material.dart';

import '../../../component/fonts.dart';
import '../../../constant/colors.dart';
import '../../../constant/screen_margin.dart';

buildAppBar(Function iconOnTap, Function searchOnTap) {
  return AppBar(
    leadingWidth: 0,
    backgroundColor: appBlue,
    leading: Container(),
    title: GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
            color: appWhite, borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            SizedBox(
              width: ScreenMargin.TOSCREEN,
            ),
            Image.asset(
              'assets/icons/icon_search.png',
              width: 16,
              height: 16,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              'Search for +6k users',
              style: t16grey,
            )
          ],
        ),
      ),
      onTap: (){
        searchOnTap();
      },
    ),
    actions: [
      GestureDetector(
        child: Stack(
          children: [
            Container(
              width: 40,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: ScreenMargin.TOSCREEN),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/icons/icon_bell.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.topRight,
              padding:
                  const EdgeInsets.only(right: ScreenMargin.TOSCREEN, top: 7),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: appRed, borderRadius: BorderRadius.circular(7)),
                width: 14,
                height: 14,
                child: Text(
                  '3',
                  style: t12blackMin,
                ),
              ),
            ),
          ],
        ),
        onTap: (){
          iconOnTap();
        },
      )
    ],
  );
}
