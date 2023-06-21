import 'package:dio/dio.dart';
import 'package:example_flutter/data/bus/bus_module.dart';
import 'package:example_flutter/data/util/mapper/response_mapper.dart';
import 'package:example_flutter/data/util/util.dart';
import 'package:example_flutter/domain/bus/bus_stop_repository.dart';
import 'package:example_flutter/domain/bus/entity/bus_stop_entity.dart';

class BusStopRepositoryImpl extends BusStopRepository {
  @override
  Future<BusStopRes?> getNearBusStop({required Dio dio, required int pageNum, required int numOfRows, required double gpsLatitude, required double gpsLongitude}) async
    => await singletonBusStopClient(dio).getBusStopList(serviceKey, pageNum, numOfRows, gpsLatitude, gpsLongitude, "json").then((res) => res.res?.toMapping());
}