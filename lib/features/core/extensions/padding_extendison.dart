import 'package:flutter/material.dart';

extension PaddingExtendison on Widget {
  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }
}
