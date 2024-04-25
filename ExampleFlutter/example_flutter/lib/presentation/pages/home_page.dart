import 'package:example_flutter/presentation/base/base_widget.dart';
import 'package:example_flutter/presentation/di/dependency_controller.dart';
import 'package:example_flutter/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../domain/bus/entity/bus_stop_entity.dart';

class MyHomePage extends BaseStatelessWidget<HomeViewModel> {

  MyHomePage({super.key});

  late List<BusStopInfoEntity?> listOfBusStop;
  late bool busInfoLoading;

  @override
  DependencyController creator() => DependencyController.to;

  @override
  HomeViewModel viewModel(BuildContext context) => Provider.of<HomeViewModel>(context, listen: false);

  @override
  void initState(BuildContext context, HomeViewModel viewModel) { }

  @override
  void rebuildState(BuildContext context, HomeViewModel viewModel) {
    listOfBusStop = context.watch<HomeViewModel>().listOfBusStopInfo;
    busInfoLoading = context.watch<HomeViewModel>().loadingBusInfo;
  }

  @override
  Widget viewBuilder(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getListView(listOfBusStop, busInfoLoading)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await viewModel.handleLocationPermission(onGrantedPermission : () async {
          await viewModel.getBusStopInfo(1, 10);
        }, onDeniedPermission: () {
          showSnackBar(context, '권한이 거부되었습니다. [설정] -> [권한]에서 권한 허용을 진행해주세요.');
        }, onDisabledService: () {
          showSnackBar(context, '권한이 거부되었습니다. [설정] -> [권한]에서 권한 허용을 진행해주세요.');
        }),
        tooltip: 'GPS',
        child: const Icon(Icons.gps_fixed),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget getListView(List<BusStopInfoEntity?> listOfBusStop, bool isLoading) {
  return isLoading ? const CircularProgressIndicator() : ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listOfBusStop.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${listOfBusStop[index]?.nodeName}'),
                const Padding(padding: EdgeInsets.only(bottom: 8)),
                Text('${listOfBusStop[index]?.nodeId}')
              ],
            ),
          ),
        );
      }
  );
}

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      behavior: SnackBarBehavior.floating,
      content: Text(content),
      duration: const Duration(seconds: 3),
    ),
  );
}
