import 'package:flutter/material.dart';

Widget errorWidget(err, stack) {
  debugPrint("Error: $err");
  debugPrint("$stack");
  return const Center(child: Text('Something bad happened 😭'));
}
