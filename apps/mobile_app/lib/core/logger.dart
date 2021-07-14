import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(methodCount: 1),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);
