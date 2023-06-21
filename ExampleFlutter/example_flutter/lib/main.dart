import 'package:example_flutter/domain/bus/usecase/bus_stop_usecase.dart';
import 'package:example_flutter/presentation/di/dependency_controller.dart';
import 'package:example_flutter/presentation/pages/home_page.dart';
import 'package:example_flutter/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  final dependencyController = DependencyController();

  runApp(MyApp(dependencyController: dependencyController,));
}

class MyApp extends StatelessWidget {

  final DependencyController dependencyController;

  const MyApp({super.key, required this.dependencyController});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.put(dependencyController, permanent: true);

    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) => HomeViewModel(BusStopUseCase(dependencyController.dio, dependencyController.busStopRepository), dependencyController.dio),
        child: MyHomePage(),
      ),
    );
  }
}

