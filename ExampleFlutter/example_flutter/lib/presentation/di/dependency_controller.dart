import 'package:dio/dio.dart';
import 'package:example_flutter/data/bus/repository/bus_repository.dart';
import 'package:example_flutter/domain/bus/usecase/bus_stop_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DependencyController extends GetxController {
  static DependencyController get to => Get.find<DependencyController>();

  final dio = Dio();
  final busStopRepository = BusStopRepositoryImpl();
}