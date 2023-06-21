import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:example_flutter/data/util/wrapper/response_wrapper.dart';
import 'package:example_flutter/domain/bus/entity/bus_stop_entity.dart';
import 'package:example_flutter/domain/bus/usecase/bus_stop_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class HomeViewModel extends ChangeNotifier {
  final Dio dio;
  final BusStopUseCase busStopUseCase;

  HomeViewModel(this.busStopUseCase, this.dio);
  List<BusStopInfoEntity> listOfBusStopInfo = [];
  bool loadingBusInfo = false;

  Future<void> getBusStopInfo(int pageNum, int numOfRows) async {
    loadingBusInfo = true;
    notifyListeners();

   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((position) async {
     log('latitude : ${position.latitude.toDouble()}, longitude : ${position.longitude.toDouble()}');

     await safeApiCall<BusStopRes?>(callApi: busStopUseCase.getBusStop(dio, pageNum, numOfRows, position.latitude.toDouble(), position.longitude.toDouble())).then((res) {
       if(res.result != null) {
         loadingBusInfo = false;
         listOfBusStopInfo = res.result?.body?.item?.items ?? [];
         log('data : ${listOfBusStopInfo.map((e) => e.toJson()).toList()}');
       }else{
         log('err : ${res.exception}');
       }
     });

     notifyListeners();
   });
  }

  Future<void> handleLocationPermission({required void Function() onGrantedPermission, required void Function() onDeniedPermission, required void Function() onDisabledService}) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      onDisabledService();
    }else{
      onGrantedPermission();
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        onDeniedPermission();
      }
    }else{
      onGrantedPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      onDeniedPermission();
    }

    onGrantedPermission();
  }
}