
import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/ui/main/model/skuSpecValue.dart';

part 'skuSpecListItem.g.dart';

@JsonSerializable()
class SkuSpecListItem {
  num? id;
  String? name;
  num? type;

  List<SkuSpecValue>? skuSpecValueList;

  SkuSpecListItem();

  factory SkuSpecListItem.fromJson(Map<String, dynamic> json) =>
      _$SkuSpecListItemFromJson(json);
}
