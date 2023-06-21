import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'bus_stop_response.g.dart';

@JsonSerializable()
class BusStopResponseEntity {
  @JsonKey(name: "response")
  final BusStopResponse? res;

  BusStopResponseEntity(this.res);

  factory BusStopResponseEntity.fromJson(Map<String, dynamic> json) => _$BusStopResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BusStopResponseEntityToJson(this);
}

@JsonSerializable()
class BusStopResponse {
  @JsonKey(name: "header")
  final HeaderResponse? header;
  @JsonKey(name: "body")
  final BodyResponse? body;

  BusStopResponse(this.header, this.body);

  factory BusStopResponse.fromJson(Map<String, dynamic> json) => _$BusStopResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BusStopResponseToJson(this);
}

@JsonSerializable()
class HeaderResponse {
  @JsonKey(name : "resultCode")
  final String? code;
  @JsonKey(name: "resultMsg")
  final String? message;

  HeaderResponse(this.code, this.message);

  factory HeaderResponse.fromJson(Map<String, dynamic> json) => _$HeaderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderResponseToJson(this);
}

@JsonSerializable()
class BodyResponse {
  @JsonKey(name : "items")
  final ItemResponse? item;
  @JsonKey(name: "numOfRows")
  final int? numberOfRows;
  @JsonKey(name: "pageNo")
  final int? pageNumber;
  @JsonKey(name: "totalCount")
  final int? totalCount;

  BodyResponse(this.item, this.numberOfRows, this.pageNumber, this.totalCount);

  factory BodyResponse.fromJson(Map<String, dynamic> json) => _$BodyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BodyResponseToJson(this);
}

@JsonSerializable()
class ItemResponse {
  @JsonKey(name: "item")
  final List<BusStopInfo>? items;

  ItemResponse(this.items);

  factory ItemResponse.fromJson(Map<String, dynamic> json) => _$ItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemResponseToJson(this);
}

@JsonSerializable()
class BusStopInfo {
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

  BusStopInfo(this.cityCode, this.gpsLatitude, this.gpsLongitude, this.nodeId, this.nodeName);

  factory BusStopInfo.fromJson(Map<String, dynamic> json) => _$BusStopInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BusStopInfoToJson(this);
}