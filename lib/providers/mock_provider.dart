import 'package:flutter/foundation.dart';

class MockProvider with ChangeNotifier {
  bool _mock = true;

  void toggle() {
    _mock = !_mock;
    notifyListeners();
  }

  String get label {
    return _mock ? "Mock" : "Live";
  }

  bool get mock => _mock;
}
