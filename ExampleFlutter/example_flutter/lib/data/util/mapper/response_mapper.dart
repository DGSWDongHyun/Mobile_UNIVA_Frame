
import '../../../domain/bus/entity/bus_stop_entity.dart';
import '../../bus/remote/dto/bus_stop_response.dart';

extension BusMapper on BusStopResponse {
  BusStopRes toMapping() => BusStopRes(
    header: HeaderResponseEntity(code: header?.code, message: header?.message),
    body: BodyResponseEntity(
        item: ItemResponseEntity(
          items: body?.item?.items?.map(
                  (e) =>
                      BusStopInfoEntity(
                          cityCode: e.cityCode,
                          gpsLatitude: e.gpsLatitude,
                          gpsLongitude: e.gpsLongitude,
                          nodeId: e.nodeId,
                          nodeName: e.nodeName,
                      )
          ).toList() ?? [],
      )
    )
  );
}