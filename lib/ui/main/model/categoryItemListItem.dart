import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'itemListItem.dart';

part 'categoryItemListItem.g.dart';

@JsonSerializable()
class CategoryItemListItem {
  Category? category;
  List<ItemListItem>? itemList;

  CategoryItemListItem();

  factory CategoryItemListItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemListItemFromJson(json);
}
