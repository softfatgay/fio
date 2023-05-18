
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/component/app_bar.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/search_widget.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';

import 'model/kingkongModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{


  @override
  bool get wantKeepAlive => true;

  double appBarHeight = 45;
  final _scrollController = ScrollController();
  final _searchTextController = TextEditingController();
  KingkongModel? sortListData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    final dio = Dio();
    var timestamp = DateTime.now().millisecondsSinceEpoch;
    var response = await dio.get(
        'https://m.you.163.com/item/list.json?https://m.you.163.com/item/list.json?__timestamp=$timestamp&categoryId=1010000&');
    setState(() {
      sortListData = KingkongModel.fromJson(response.data['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  _buildContent() {
    if (sortListData == null) {
      return Container();
    }
    var categoryItemList = sortListData?.categoryItemList;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: categoryItemList!.map<Widget>((item) {
          return Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: ScreenMargin.TOSCREEN),
                  child: Text(
                    '${item.category!.name}',
                    style: t16black,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: item.itemList!.map<Widget>((itemItem) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: item.itemList!.indexOf(itemItem) == 0
                                ? ScreenMargin.TOSCREEN
                                : ScreenMargin.TOSCREEN / 2,
                            right: item.itemList!.indexOf(itemItem) ==
                                    item.itemList!.length - 1
                                ? ScreenMargin.TOSCREEN
                                : 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _netImg(itemItem.scenePicUrl!),
                            const SizedBox(height: 4),
                            ConstrainedBox(
                              constraints:
                                  const BoxConstraints(maxWidth: 115),
                              child: Text(
                                '${itemItem.name}',
                                style: t12black,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$${itemItem.counterPrice}',
                                  style: t14black,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '\$${itemItem.retailPrice}',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: textLightGrey,
                                      decoration: TextDecoration.lineThrough,
                                      fontFamily: 'DINAlternateBold'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  _netImg(String url) {
    return Container(
      height: 115,
      width: 115,
      decoration: BoxDecoration(
          color: const Color(0xFFE5E5E5),
          borderRadius: BorderRadius.circular(3)),
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
          ),
        ),
        imageUrl: url,
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: SearchWidget(controller: _searchTextController,searchHeight: appBarHeight),
            ),
            Container(
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
                            '2',
                            style:const TextStyle(fontSize: 9, color: textWhite, height: 1.1),
                          ),
                        ),),
                    ],
                  ),
                ),
                onTap: () {

                },
              ),
            ),
          ],
        ),
      ),
      shadowColor: appWhite,
    );
  }

}
