import 'package:flutter/material.dart';
import 'package:flutter_application_3/typeadapter.dart';

class WidWid extends StatelessWidget {
  final TypeAdapter typeAdapter;

  WidWid({required this.typeAdapter});

  @override
  Widget build(BuildContext context) {
    return typeAdapter.item;
  }
}
