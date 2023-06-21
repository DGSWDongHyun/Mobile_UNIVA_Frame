import 'package:dio/dio.dart';
import 'package:example_flutter/data/bus/remote/api/bus_remote.dart';

BusStopRemote? busStopRemote;

BusStopRemote singletonBusStopClient(Dio dio) {
  busStopRemote ??= BusStopRemote(dio);

  return busStopRemote!;
}