// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_stop_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusStopResponseEntity _$BusStopResponseEntityFromJson(
        Map<String, dynamic> json) =>
    BusStopResponseEntity(
      json['response'] == null
          ? null
          : BusStopResponse.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusStopResponseEntityToJson(
        BusStopResponseEntity instance) =>
    <String, dynamic>{
      'response': instance.res,
    };

BusStopResponse _$BusStopResponseFromJson(Map<String, dynamic> json) =>
    BusStopResponse(
      json['header'] == null
          ? null
          : HeaderResponse.fromJson(json['header'] as Map<String, dynamic>),
      json['body'] == null
          ? null
          : BodyResponse.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusStopResponseToJson(BusStopResponse instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

HeaderResponse _$HeaderResponseFromJson(Map<String, dynamic> json) =>
    HeaderResponse(
      json['resultCode'] as String?,
      json['resultMsg'] as String?,
    );

Map<String, dynamic> _$HeaderResponseToJson(HeaderResponse instance) =>
    <String, dynamic>{
      'resultCode': instance.code,
      'resultMsg': instance.message,
    };

BodyResponse _$BodyResponseFromJson(Map<String, dynamic> json) => BodyResponse(
      json['items'] == null
          ? null
          : ItemResponse.fromJson(json['items'] as Map<String, dynamic>),
      json['numOfRows'] as int?,
      json['pageNo'] as int?,
      json['totalCount'] as int?,
    );

Map<String, dynamic> _$BodyResponseToJson(BodyResponse instance) =>
    <String, dynamic>{
      'items': instance.item,
      'numOfRows': instance.numberOfRows,
      'pageNo': instance.pageNumber,
      'totalCount': instance.totalCount,
    };

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) => ItemResponse(
      (json['item'] as List<dynamic>?)
          ?.map((e) => BusStopInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemResponseToJson(ItemResponse instance) =>
    <String, dynamic>{
      'item': instance.items,
    };

BusStopInfo _$BusStopInfoFromJson(Map<String, dynamic> json) => BusStopInfo(
      json['citycode'] as int?,
      json['gpslati'],
      json['gpslong'],
      json['nodeid'] as String?,
      json['nodenm'] as String?,
    );

Map<String, dynamic> _$BusStopInfoToJson(BusStopInfo instance) =>
    <String, dynamic>{
      'citycode': instance.cityCode,
      'gpslati': instance.gpsLatitude,
      'gpslong': instance.gpsLongitude,
      'nodeid': instance.nodeId,
      'nodenm': instance.nodeName,
    };
