import 'dart:async';

import 'package:flutter/material.dart';

class TimingNotifier extends ChangeNotifier {
  bool ifstarted = false;
  Timer time;
  double totalTime = 0;

  tapStart() {
    if (!ifstarted) {
      startRecordTime();
      ifstarted = true;
    }
  }

  tapStop() {
    if (ifstarted) {
      stopRecordTime();
      ifstarted = false;
    }
  }

  tapReStart() {
    totalTime = 0;
    notifyListeners();
  }

  startRecordTime() {
    time = Timer.periodic(Duration(milliseconds: 1000), (_) {
      totalTime += 1;
      notifyListeners();
    });
  }

  stopRecordTime() {
    time.cancel();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
