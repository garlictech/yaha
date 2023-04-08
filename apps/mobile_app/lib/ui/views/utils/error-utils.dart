import 'package:flutter/material.dart';

Widget errorWidget(err, dynamic stack) {
  debugPrint("Error: $err");
  debugPrint("${stack ?? StackTrace.current}");
  return const Center(child: Text('Something bad happened 😭'));
}
