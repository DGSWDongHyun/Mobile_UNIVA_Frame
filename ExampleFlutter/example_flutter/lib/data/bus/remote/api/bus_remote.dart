import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../util/util.dart';
import '../dto/bus_stop_response.dart';

part 'bus_remote.g.dart';

@RestApi(baseUrl: getBusStopURL)
abstract class BusStopRemote {
  factory BusStopRemote(Dio dio, {String baseUrl}) = _BusStopRemote;

  @GET("getCrdntPrxmtSttnList")
  Future<BusStopResponseEntity> getBusStopList(
        @Query("serviceKey") String key,
        @Query("pageNo") int pageNum,
        @Query("numOfRows") int numOfRows,
        @Query("gpsLati") double gpsLatitude,
        @Query("gpsLong") double gpsLongitude,
        @Query("_type") String returnType,
      );
}