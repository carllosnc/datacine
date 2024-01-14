import 'package:flutter/material.dart';

class _AuthNotifier {
  ValueNotifier<bool> isSignedIn = ValueNotifier(false);

  void setSignedIn(bool value) {
    isSignedIn.value = value;
  }
}

var authNotifier = _AuthNotifier();
