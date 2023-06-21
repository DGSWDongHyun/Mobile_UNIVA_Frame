import 'package:dio/dio.dart';

import 'entity/bus_stop_entity.dart';

abstract class BusStopRepository {
  Future<BusStopRes?> getNearBusStop({required Dio dio, required int pageNum, required int numOfRows, required double gpsLatitude, required double gpsLongitude});
}
