import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../di/dependency_controller.dart';

abstract class BaseStatelessWidget<T extends ChangeNotifier> extends StatelessWidget {
  BaseStatelessWidget({super.key});

  bool isInit = true;

  void initState(BuildContext context);
  void rebuildState(BuildContext context);
  Widget viewBuilder(BuildContext context);

  T viewModel(BuildContext context);
  DependencyController creator();

  @override
  Widget build(BuildContext context) {
    if(isInit) {
      initState(context);
      isInit = false;
    }
    rebuildState(context);
    Get.put(() => creator());
    return GestureDetector(
      onTap: () {
        if(FocusManager.instance.primaryFocus != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: ChangeNotifierProvider<T>.value(
        value: viewModel(context),
        child: viewBuilder(context),
      )
    );
  }
}
