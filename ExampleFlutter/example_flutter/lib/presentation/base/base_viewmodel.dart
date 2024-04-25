import 'package:flutter/cupertino.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool isInit = false;

  void onDisposed();

  @override
  void dispose() {
    onDisposed();
    isInit = true;
    super.dispose();
  }
}