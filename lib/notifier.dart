import 'package:flutter/cupertino.dart';

class PgNotifier extends ChangeNotifier {
  PgNotifier(this.c1, this.c2);
  final PageController c1;
  final PageController c2;

  double? _offset;

  @override
  void notifyListeners() {
    final currentOffset = c1.offset;
    if (currentOffset != _offset) {
      _offset = currentOffset;
      c1.jumpTo(_offset!);
      c2.jumpTo(_offset!);

      super.notifyListeners();
    }
  }
}
