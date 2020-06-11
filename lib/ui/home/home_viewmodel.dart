import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  int _counter = 0;
  String get counter => '$_counter';

  void update() {
    _counter++;
    notifyListeners();
  }
}
