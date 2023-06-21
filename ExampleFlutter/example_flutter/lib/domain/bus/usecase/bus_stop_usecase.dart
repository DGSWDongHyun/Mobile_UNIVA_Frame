import 'package:dio/dio.dart';

import '../bus_stop_repository.dart';
import '../entity/bus_stop_entity.dart';

class BusStopUseCase {
  final Dio dio;
  final BusStopRepository busStopRepository;

  BusStopUseCase(this.dio, this.busStopRepository);

  Future<BusStopRes?> getBusStop(Dio dio, int pageNum, int numOfRows, double gpsLatitude, double gpsLongitude) async
    => await busStopRepository.getNearBusStop(dio: dio, pageNum: pageNum, numOfRows: numOfRows, gpsLatitude: gpsLatitude, gpsLongitude: gpsLongitude);
}