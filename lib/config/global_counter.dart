import 'package:rxdart/rxdart.dart';

class GlobalCounter {
  static BehaviorSubject<int> counter = BehaviorSubject.seeded(0);
}
