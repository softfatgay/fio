import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/indicator_banner.dart';
import 'package:untitled/ui/component/round_net_image.dart';
import 'package:untitled/ui/component/slivers.dart';
import 'package:untitled/ui/component/star_widget.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';
import 'package:untitled/ui/main/component/cart_widget.dart';
import 'package:untitled/utils/LogUtil.dart';

class GoodDetailPage extends StatefulWidget {
  final Map? params;

  const GoodDetailPage({Key? key, this.params}) : super(key: key);

  @override
  State<GoodDetailPage> createState() => _GoodDetailPageState();
}

class _GoodDetailPageState extends State<GoodDetailPage> {
  late String _goodId;

  final _scrollPhysics = const AlwaysScrollableScrollPhysics();
  final _scrollController = ScrollController();
  var _goodDetail;

  final _streamController = StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_addScrollListener);
    setState(() {
      _goodId = num.parse(widget.params!['id']).toString();
    });
    _getGoodDetail();
  }

  void _addScrollListener() {
    if (_scrollController.position.pixels > 255) {
    } else {
      _streamController.sink.add(_scrollController.position.pixels.toInt()+50);
    }
  }

  void _getGoodDetail() async {
    var dio = Dio();
    var response =
    await dio.get('https://m.you.163.com/item/detail.json?id=$_goodId');
    var data = response.data;
    setState(() {
      _goodDetail = data['item'];
    });
    LogUtil.d(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return buildAppBar(context);
  }

  @override
  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      child: _buildTitle(),
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        50 ,
      ),
    );
  }

  _buildTitle() {
    return StreamBuilder(
        stream: _streamController.stream,
        initialData: 0,
        builder: (context, snapshot) {
          var data = snapshot.data ?? 0;
          var alpha =  0;
          if(data >255){
            alpha = 255;
          }else {
            alpha = data;
          }
          return Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(alpha),
              border: Border(bottom: BorderSide(color:data >=255 ? lineColor : Colors.transparent ))
            ),
            child: Row(
              children: [
                IconButton(onPressed: (){

                }, icon: Icon(Icons.arrow_back,color: appBlack.withAlpha(alpha),)),
                Expanded(child: Text(
                  'Item detail',
                  style: TextStyle(fontSize: 18,color: appBlack.withAlpha(alpha)),
                ),),
                const CartWidget(count: 0),
                const SizedBox(width: 16),
                Container(
                  margin: const EdgeInsets.only(right: ScreenMargin.TOSCREEN),
                  width: 42,
                  height: 42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: backGrey, borderRadius: BorderRadius.circular(20)),
                  child:
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                ),
              ],
            ),
          );
        }
    );
  }

  _buildBody() {
    return CustomScrollView(
      controller: _scrollController,
      physics: _scrollPhysics,
      slivers: [
        singleSliverWidget(_buildBanner()),
        singleSliverWidget(_buildGoodDes()),
        singleSliverWidget(_line()),
        singleSliverWidget(_buildEnvio()),
        singleSliverWidget(_line()),
        singleSliverWidget(_ownerStore()),
        singleSliverWidget(_line()),
        singleSliverWidget(_buildDelivery()),
      ],
    );
  }

  Widget _buildBanner() {
    List<String> banner = [];
    Map<String, dynamic> dataList = _goodDetail['itemDetail'];
    List<dynamic> bannerList = List<dynamic>.from(dataList.keys);
    bannerList.forEach((key) {
      if (key.startsWith('picUrl')) {
        banner.add(dataList[key].toString());
      }
    });
    return Container(
      child: IndicatorBanner(
          dataList: banner,
          fit: BoxFit.cover,
          height: 300,
          margin: const EdgeInsets.all(0),
          corner: 0,
          indicatorType: IndicatorType.num,
          onPress: (index) {}),
    );
  }

  Widget _buildGoodDes() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('${_goodDetail['name']}', style: t20black),
          Text('\$${_goodDetail['counterPrice']}', style: t20blackBold),
          const SizedBox(height: 20),
          const Text('Description', style: t12grey),
          Text('${_goodDetail['simpleDesc']}', style: t12black),
          const SizedBox(height: 20),
          const Text('Category', style: t12grey),
          Text('Electronic / clothes / watches', style: t12black),
          const SizedBox(height: 20),
          const Text('Brand', style: t12grey),
          Text('Lenovo', style: t12black),
          const SizedBox(height: 20),
          const Text('Condition', style: t12grey),
          Text('Like New', style: t12black),
          const SizedBox(height: 20),
          const Text('Color', style: t12grey),
          Text('Blue / Black', style: t12black),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            child: Text('Listed 2m ago', style: t12grey),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildEnvio() {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN, vertical: 30),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ennvio', style: t12grey),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                      'Llega entre 21 dic. y 16 ene. a Bariloche 4040 con Envios Loupeil por 80',
                      style: t14black,
                    )),
                SizedBox(width: 30),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _line() {
    return Container(
      height: 10,
      color: backColor,
    );
  }

  Widget _ownerStore() {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: ScreenMargin.TOSCREEN, vertical: 30),
      child: Row(
        children: [
          RoundNetImage(
              width: 45,
              height: 45,
              corner: 23,
              url: '${_goodDetail['scenePicUrl']}'),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sheila Rose',
                  style: t14black,
                ),
                Row(
                  children: [
                    StaticRatingBar(
                      rate: 4.5,
                      size: 16,
                    ),
                    Text(
                      '(${21})',
                      style: t12black,
                    )
                  ],
                )
              ],
            ),
          ),
          MaterialButton(
            elevation: 0,
            onPressed: () {},
            child: Text(
              'See store',
              style: t12black,
            ),
            color: Color(0xFFF1F3F8),
          )
        ],
      ),
    );
  }

  Widget _buildDelivery() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenMargin.TOSCREEN, vertical: 30),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/icon_delivery.png',
            width: 24,
            height: 24,
          ),
          SizedBox(width: 10,),
          Expanded(child: Text(
            'We’ll use these details to keep you informed on your delivery.',
            style: t14black,),),
          SizedBox(width: 30),
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
          )
        ],
      ),
    );
  }

}
