import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/app/app.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

final gameRulesServiceProvider =
    Provider<GameRulesService>((ref) => GameRulesServicePlain());
