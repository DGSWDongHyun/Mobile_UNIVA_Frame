import 'package:flutter/cupertino.dart';

abstract class BaseViewModel extends ChangeNotifier {
  /*
  * BaseViewModel
  *
  * - isInit의 상태 관리를 ViewModel에서 하는 것이 더 나을 것 같다 판단되어 해당 상태관리를 이전하면서 추가된 클래스
  * - isInit을 통해 해당 Provider의 라이프사이클이 초기화된 것인지 알 수 있음
  * - 해당 ViewModel을 상속받아서 ScrollController, TextEditingController 등등을 추가하여 사용할 수 있음
  * - Controller의 dispose는 onDisposed() 함수 내부에서 할 수 있음.
  */

  bool isInit = false;

  void onDisposed();

  @override
  void dispose() {
    onDisposed();
    isInit = true;
    super.dispose();
  }
}