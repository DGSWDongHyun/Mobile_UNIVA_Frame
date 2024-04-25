import 'package:example_flutter/presentation/base/base_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../di/dependency_controller.dart';

abstract class BaseStatelessWidget<T extends BaseViewModel> extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  /*
  * BaseStatelessWidget
  *
  * - 기본적으로 상태관리에 의존하는 위젯이므로, StatefulWidget은 필요없다고 판단함.
  * - dispose 상태와 같은 것은 전부 BaseViewModel ( ChangeNotifier ) 에 전달하며, ScrollController, TextEditingController 같은 컨트롤러 역시 전부 ViewModel에서 상속받아서 활용함.
  * - Controller에 불가피하게 Context가 첨부되는 경우, BaseStatefulWidget을 사용하면 좋지만, 이 경우는 BaseViewModel을 활용하지 않는 것이 좋음.
  *
  * = initState
  *   - 상태관리자가 최초로 생성 되었을 때, 초기화를 위한 첫 실행만 시키는 메소드
  * = rebuildState
  *   - 상태관리자가 notifyListeners() 메소드를 실행시킬 경우, 감시할 데이터를 가져오는 메소드
  * = viewBuilder()
  *   - 위 두 가지의 메소드가 전부 실행된 이후 넘어가는 WidgetBuilder, 기존 build()의 메소드와 동일하나, viewModel에 접근이 가능하도록 설계를 수정하였음.
  *
  * + 추가
  *
  * - isInit은 상태관리에 해당하므로, 해당 파트도 ViewModel 파트로 이전시킴
  * - 또한 initState에서 addPostFrameCallback으로 Context를 정상적으로 받은 이후에 콜백으로 받은 initState를 실행시킴.
  * - Android Google Architecture 중에서 SingleActivity Architecture ( SAA )를 지향하는 아키텍쳐.
  * - 따라서 Fragment의 개념이 포함되는 경우에는 부모 Widget의 ViewModel을 넘겨주는 것이 이상적인 방법.
  */

  void initState(BuildContext context, T viewModel);
  void rebuildState(BuildContext context, T viewModel);
  Widget viewBuilder(BuildContext context, T viewModel);

  T viewModel(BuildContext context);
  DependencyController creator();

  @override
  Widget build(BuildContext context) {
    if(viewModel(context).isInit) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        initState(context, viewModel(context));
        viewModel(context).isInit = false;
      });
    }
    rebuildState(context, viewModel(context));
    Get.put(() => creator());
    return GestureDetector(
      onTap: () {
        if(FocusManager.instance.primaryFocus != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: ChangeNotifierProvider<T>.value(
        value: viewModel(context),
        child: viewBuilder(context, viewModel(context)),
      )
    );
  }
}
