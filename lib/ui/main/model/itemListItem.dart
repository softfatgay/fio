

import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/ui/main/model/skuSpecListItem.dart';
import 'package:untitled/ui/main/model/topLogo.dart';

import 'finalPriceInfoVO.dart';
import 'hotSaleListBottomInfo.dart';
import 'itemTagListItem.dart';
import 'listPromBanner.dart';

part 'itemListItem.g.dart';

@JsonSerializable()
class ItemListItem {
  num? id;
  String? listPicUrl;
  String? name;
  String? seoTitle;
  String? simpleDesc;
  String? primaryPicUrl;
  String? productPlace;
  num? counterPrice;
  num? primarySkuId;
  num? retailPrice;
  num? status;
  num? colorNum;
  String? promDesc;
  bool? soldOut;
  bool? underShelf;
  String? scenePicUrl;
  String? promTag;
  String? goodCmtRate;
  HotSaleListBottomInfo? hotSaleListBottomInfo;

  List<ItemTagListItem>? itemTagList;
  ListPromBanner? listPromBanner;
  List<SkuSpecListItem>? skuSpecList;
  FinalPriceInfoVO? finalPriceInfoVO;

  TopLogo? topLogo;

  ///新品首发中使用
  num? sortOriginPrice;

  ItemListItem();

  factory ItemListItem.fromJson(Map<String, dynamic> json) =>
      _$ItemListItemFromJson(json);
}
