import 'package:flutter/material.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';
import 'package:untitled/ui/main/home/component/home_app_bar.dart';

class HomeNewPage extends StatefulWidget {
  const HomeNewPage({Key? key}) : super(key: key);

  @override
  State<HomeNewPage> createState() => _HomeNewPageState();
}

class _HomeNewPageState extends State<HomeNewPage> {
  var _data = ["", "", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  _buildAppBar() {
    return buildAppBar(() {
      print('----------------------');
    }, () {});
  }

  _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ScreenMargin.TOSCREEN,
          ),
          Text(
            'Recent news',
            style: t20black,
          ),
          SizedBox(
            height: ScreenMargin.TOSCREEN,
          ),
          SingleChildScrollView(
            child: Column(
              children: _data.map<Widget>((e) {
                return _buildItem(e);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  _buildItem(String e) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN,vertical: ScreenMargin.TOSCREEN),
      decoration: BoxDecoration(
          color: appWhite, borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          const Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is a new, like a notice, it has 2 lines...',
                style: t16black,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10,),
              Text(
                '3 days ago...',
                style: t12grey,
              ),
            ],
          )),
          const SizedBox(width: 24,),
          Image.asset('assets/icons/place_holder.png',width: 70,height: 70,),
        ],
      ),
    );
  }
}
