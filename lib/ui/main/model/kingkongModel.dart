import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'categoryItemListItem.dart';

part 'kingkongModel.g.dart';

@JsonSerializable()
class KingkongModel {
  Category? currentCategory;
  List<CategoryItemListItem>? categoryItemList;

  KingkongModel();

  factory KingkongModel.fromJson(Map<String, dynamic> json) =>
      _$KingkongModelFromJson(json);
}
