import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/router/Router.dart';
import 'package:untitled/ui/component/fonts.dart';
import 'package:untitled/ui/component/search_widget.dart';
import 'package:untitled/ui/constant/colors.dart';
import 'package:untitled/ui/constant/screen_margin.dart';
import 'package:untitled/ui/main/component/cart_widget.dart';
import 'package:untitled/ui/main/model/itemListItem.dart';

import 'model/categoryItemListItem.dart';
import 'model/kingkongModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {


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
    var timestamp = DateTime
        .now()
        .millisecondsSinceEpoch;
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
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '${item.category!.name}',
                    style: t16black,
                  ),
                ),
                const SizedBox(height: 10),
                _buildHorItem(item),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: item.itemList!.map<Widget>((itemItem) {
                //       return _buildItem(item, itemItem);
                //     }).toList(),
                //   ),
                // )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  _buildHorItem(CategoryItemListItem item){
    var sublist = item.itemList!.sublist(0,3);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: sublist.map<Widget>((itemItem) {
        return _buildItem(item, itemItem);
      }).toList(),
    );
  }

  _netImg(String url) {
    return Container(
      height: 115,
      width: (MediaQuery.of(context).size.width-48)/3,
      decoration: BoxDecoration(
          color: const Color(0xFFE5E5E5),
          borderRadius: BorderRadius.circular(3)),
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) =>
            Container(
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
              child: GestureDetector(
                child: Container(
                  height: appBarHeight,
                  padding: const EdgeInsets.only(left: 12),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: backGrey,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Icon(Icons.search),
                ),
                onTap: () {
                  Routers.push(context, Routers.searchIndexPage);
                },
              ),
            ),
            const CartWidget(count: 0),
          ],
        ),
      ),
      shadowColor: appWhite,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    _searchTextController.dispose();
    super.dispose();
  }

  _buildItem(CategoryItemListItem item, ItemListItem itemItem) {
    return GestureDetector(
      child: Container(
        // padding: EdgeInsets.only(
        //     left: item.itemList!.indexOf(itemItem) == 0
        //         ? ScreenMargin.TOSCREEN
        //         : ScreenMargin.TOSCREEN / 2,
        //     right: item.itemList!.indexOf(itemItem) ==
        //         item.itemList!.length - 1
        //         ? ScreenMargin.TOSCREEN
        //         : 0),
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
      ),
      onTap: () {
        Routers.push(context, Routers.goodDetailPage, {'id': itemItem.id.toString()});
      },
    );
  }
}
