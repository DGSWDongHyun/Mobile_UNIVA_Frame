
import 'package:json_annotation/json_annotation.dart';

import '../../../data/bus/remote/dto/bus_stop_response.dart';

part 'bus_stop_entity.g.dart';

@JsonSerializable()
class BusStopResEntity {
  @JsonKey(name: "response")
  final BusStopResponse? res;

  BusStopResEntity({this.res});

  factory BusStopResEntity.fromJson(Map<String, dynamic> json) => _$BusStopResEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BusStopResEntityToJson(this);
}

@JsonSerializable()
class BusStopRes {
  @JsonKey(name: "header")
  final HeaderResponseEntity? header;
  @JsonKey(name: "body")
  final BodyResponseEntity? body;

  BusStopRes({this.header, this.body});

  factory BusStopRes.fromJson(Map<String, dynamic> json) => _$BusStopResFromJson(json);

  Map<String, dynamic> toJson() => _$BusStopResToJson(this);
}

@JsonSerializable()
class HeaderResponseEntity {
  @JsonKey(name : "resultCode")
  final String? code;
  @JsonKey(name: "resultMsg")
  final String? message;

  HeaderResponseEntity({this.code, this.message});

  factory HeaderResponseEntity.fromJson(Map<String, dynamic> json) => _$HeaderResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderResponseEntityToJson(this);
}

@JsonSerializable()
class BodyResponseEntity {
  @JsonKey(name : "items")
  final ItemResponseEntity? item;
  @JsonKey(name: "numOfRows")
  final int? numberOfRows;
  @JsonKey(name: "pageNo")
  final int? pageNumber;
  @JsonKey(name: "totalCount")
  final int? totalCount;

  BodyResponseEntity({this.item, this.numberOfRows, this.pageNumber, this.totalCount});

  factory BodyResponseEntity.fromJson(Map<String, dynamic> json) => _$BodyResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BodyResponseEntityToJson(this);
}

@JsonSerializable()
class ItemResponseEntity {
  @JsonKey(name: "item")
  final List<BusStopInfoEntity>? items;

  ItemResponseEntity({this.items});

  factory ItemResponseEntity.fromJson(Map<String, dynamic> json) => _$ItemResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ItemResponseEntityToJson(this);
}

@JsonSerializable()
class BusStopInfoEntity {
  @JsonKey(name: "citycode")
  final int? cityCode;
  @JsonKey(name: "gpslati")
  final dynamic gpsLatitude;
  @JsonKey(name: "gpslong")
  final dynamic gpsLongitude;
  @JsonKey(name : "nodeid")
  final String? nodeId;
  @JsonKey(name : "nodenm")
  final String? nodeName;

  BusStopInfoEntity({this.cityCode, this.gpsLatitude, this.gpsLongitude, this.nodeId, this.nodeName});

  factory BusStopInfoEntity.fromJson(Map<String, dynamic> json) => _$BusStopInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BusStopInfoEntityToJson(this);
}