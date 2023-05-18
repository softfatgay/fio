import 'package:json_annotation/json_annotation.dart';

import 'bannerItem.dart';
import 'itemPicBeanList.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  num? id;
  num? superCategoryId;
  num? showIndex;
  String? picUrl;
  String? categoryName;
  String? targetUrl;
  String? showPicUrl;
  String? wapBannerUrl;
  String? name;
  String? frontName;
  List<ItemPicBeanList>? itemPicBeanList;
  List<BannerItem>? bannerList;
  String? test;
  Category();

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
