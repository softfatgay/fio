
import 'package:flutter/material.dart';
import 'package:untitled/ui/constant/colors.dart';

class CartWidget extends StatelessWidget {
  final appBarHeight = 42.0;
  final num count;
  const CartWidget({Key? key, this.count = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildWidget(context);
  }

   _buildWidget(BuildContext context) {
    return  Container(
      width: appBarHeight,
      height: appBarHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: backGrey,
          borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.only(left: 16),
      child: GestureDetector(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/main/ic_tab_sell_active.png',
                width: 22,
                height: 22,
              ),
              Positioned(
                top: 2,
                right:2,
                child: Container(
                  alignment: Alignment.center,
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                      color: appRed,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: textWhite, width: 1)),
                  child: Text(
                    '$count',
                    style:const TextStyle(fontSize: 9, color: textWhite, height: 1.1),
                  ),
                ),),
            ],
          ),
        ),
        onTap: () {

        },
      ),
    );
  }
}
