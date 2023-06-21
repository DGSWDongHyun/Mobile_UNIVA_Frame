// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_stop_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusStopResEntity _$BusStopResEntityFromJson(Map<String, dynamic> json) =>
    BusStopResEntity(
      res: json['response'] == null
          ? null
          : BusStopResponse.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusStopResEntityToJson(BusStopResEntity instance) =>
    <String, dynamic>{
      'response': instance.res,
    };

BusStopRes _$BusStopResFromJson(Map<String, dynamic> json) => BusStopRes(
      header: json['header'] == null
          ? null
          : HeaderResponseEntity.fromJson(
              json['header'] as Map<String, dynamic>),
      body: json['body'] == null
          ? null
          : BodyResponseEntity.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusStopResToJson(BusStopRes instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

HeaderResponseEntity _$HeaderResponseEntityFromJson(
        Map<String, dynamic> json) =>
    HeaderResponseEntity(
      code: json['resultCode'] as String?,
      message: json['resultMsg'] as String?,
    );

Map<String, dynamic> _$HeaderResponseEntityToJson(
        HeaderResponseEntity instance) =>
    <String, dynamic>{
      'resultCode': instance.code,
      'resultMsg': instance.message,
    };

BodyResponseEntity _$BodyResponseEntityFromJson(Map<String, dynamic> json) =>
    BodyResponseEntity(
      item: json['items'] == null
          ? null
          : ItemResponseEntity.fromJson(json['items'] as Map<String, dynamic>),
      numberOfRows: json['numOfRows'] as int?,
      pageNumber: json['pageNo'] as int?,
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$BodyResponseEntityToJson(BodyResponseEntity instance) =>
    <String, dynamic>{
      'items': instance.item,
      'numOfRows': instance.numberOfRows,
      'pageNo': instance.pageNumber,
      'totalCount': instance.totalCount,
    };

ItemResponseEntity _$ItemResponseEntityFromJson(Map<String, dynamic> json) =>
    ItemResponseEntity(
      items: (json['item'] as List<dynamic>?)
          ?.map((e) => BusStopInfoEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemResponseEntityToJson(ItemResponseEntity instance) =>
    <String, dynamic>{
      'item': instance.items,
    };

BusStopInfoEntity _$BusStopInfoEntityFromJson(Map<String, dynamic> json) =>
    BusStopInfoEntity(
      cityCode: json['citycode'] as int?,
      gpsLatitude: json['gpslati'],
      gpsLongitude: json['gpslong'],
      nodeId: json['nodeid'] as String?,
      nodeName: json['nodenm'] as String?,
    );

Map<String, dynamic> _$BusStopInfoEntityToJson(BusStopInfoEntity instance) =>
    <String, dynamic>{
      'citycode': instance.cityCode,
      'gpslati': instance.gpsLatitude,
      'gpslong': instance.gpsLongitude,
      'nodeid': instance.nodeId,
      'nodenm': instance.nodeName,
    };
